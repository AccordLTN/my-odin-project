class HttpServer
  def initialize(session, request, base_path)
    @session = session
    @request = request
    @base_path = base_path
  end

  def serve
    @full_path = get_full_path

    found_response = "HTTP/1.1 200/OK\r\nServer: Meowkins\r\nContent-type:"
    not_found_response = "HTTP/1.1 404/Object Not Found\r\nServer: Meowkins\r\n\r\n"
    
    src = nil

    begin
      if File.exist?(@full_path) && File.file?(@full_path)
        # full_path should begin with base_path, else 404
        if @full_path.index(@base_path) == 0
          @session.puts "#{found_response} #{get_content_type(@full_path)}\r\n\r\n"
          src = File.readlines(@full_path)
          src.each do |line|
            @session.puts line
            puts line
          end
          src = nil
        else
          puts "403'd"
          @session.print not_found_response
        end
      else
        puts "404'd"
        @session.print not_found_response
      end
    ensure
      @session.close
    end
  end

  def get_full_path
    file_name = nil
    
    if @request =~ /GET .* HTTP.*/
      file_name = @request.gsub(/GET /, '').gsub(/ HTTP.*/, '').strip
    end
    
    unless file_name == nil
      file_name = @base_path + file_name
      file_name = File.expand_path(file_name, @defaultPath)
      file_name.gsub!('\\', '/')
    end
    
    file_name << "/index.html" if  File.directory?(file_name)
    
    file_name
  end

  def get_content_type(path)
    ext = File.extname(path)
    return "text/html"  if ext == ".html" or ext == ".htm"
    return "text/plain" if ext == ".txt"
    return "text/css"   if ext == ".css"
    return "image/jpeg" if ext == ".jpeg" or ext == ".jpg"
    return "image/gif"  if ext == ".gif"
    return "image/bmp"  if ext == ".bmp"
    return "text/plain" if ext == ".rb"
    return "text/xml"   if ext == ".xml"
    return "text/xml"   if ext == ".xsl"
    return "text/html"
  end
end