require "socket"
require_relative "./tiny_web_server/http_server.rb"

base_path = "/home/accordltn/Dropbox/Public/dev/the-odin-project/ruby/project-ruby-on-the-web/socket_programming/app"
server = TCPServer.open(2000)
puts "Server Online."

loop do
  session = server.accept
  request = session.gets
  puts "==============================================="
  puts "#{session.peeraddr[2]} (#{session.peeraddr[3]})"
  puts Time.now.localtime.strftime("%Y/%m/%d %H:%M:%S")
  puts "#{request}"
  
  Thread.start(session, request) do |session, request|
    HttpServer.new(session, request, base_path).serve()
  end
end















# server = TCPServer.open(2000)
# index = File.readlines("./app/index.html")

# loop {
#   client = server.accept
#   puts client.gets
#   #client.puts(Time.now.ctime)
#   #client.puts "Closing the connection. Bye!"
#   index.each do |line|
#     client.puts line
#   end

#   puts "Client processed."
#   client.close
# }