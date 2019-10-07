=begin
require 'terminal-notifier'

gem install terminal-notifier

TerminalNotifier.notify('Hello World')
  

def request_email
    prompt = TTY::Prompt.new
    puts ""
    puts ">> What's your email address?"
    prompt.ask('What is your email?') { |q| q.validate :email }
  end

  def verify_email
    prompt = TTY::Prompt.new
    puts "Your email: #{email}  "
    puts ""
    prompt.yes?("Is this correct?")
  end


  def notify_settings
    prompt = TTY::Prompt.new
    puts "-----------------------------"
    prompt.select("When do you want to be notified?") do |prompt|
      prompt.choice ">>>> waves @ 1-2ft", 1
      prompt.choice ">> waves @ 2-3ft", 2
      prompt.choice ">> waves @ 4-5ft", 3
      prompt.choice ">> waves >= 6ft", 4
    end
    puts "-----------------------------"
  end


  def finalize_notify
    prompt = TTY::Prompt.new
    
    puts ""
    prompt.select("Nice, your notification set. What would you like to do now?") do |prompt|
      prompt.choice "return to main menu"
      prompt.choice "set another notification"
    end
  end

end

=end
