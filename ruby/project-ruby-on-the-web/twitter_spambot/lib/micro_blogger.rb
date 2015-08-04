require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
      puts "Message posted."
    else
      puts "That message is too long.  140 character maximum."
    end
  end

  def direct_message(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message
  end

  def everyones_last_tweet
    friends = @client.friends
    friends.each do |friend|
      # find each friend's last message
      # print each friend's screen_name
      #puts friend.screen_name
      puts friend.to_s
      # print each friend's last message
      puts ""
    end
  end

  def run
    puts "Just tell me what you want to tweet, lets get this over with.\n\n"

    command = ""
    while command != "q"
      printf "Enter command: "
      input = gets.chomp.split(" ")
      command = input[0]

      case command
        when "q"  then puts "Goodbye!"
        when "t"  then tweet(input[1..-1].join(" "))
        when "dm" then direct_message(input[1], input[2..-1].join(" "))
        when "elt" then everyones_last_tweet
        else
          puts "Sorry, I don't know how to #{command}."
      end
    end
  end
end

blogger = MicroBlogger.new
blogger.run





















#blogger.tweet("MicroBlogger Initialized")
#blogger.tweet("Exactly 140 characters. ".ljust(140, "1"))
#blogger.tweet("Exactly 141 characters. 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111")