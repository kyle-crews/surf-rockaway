class SurfToday::CLI
    
    def call
        puts ""
        puts "|| Welcome"
        puts "|| to"
        puts "|| Surf Today"
        puts ""
        puts "| Ready to surf? |"
        puts ""
        current_surf
        main_menu
        puts ""
        request_email
        verify_email
        notify_settings
        finalize_notify
        next_few_days
    end

    def current_surf
        @waves = SurfToday::Condition.today
        @options = SurfToday::Condition.menu_options
        @options.each.with_index do |selection, i|
            puts "#{i}. #{selection.one}"
            puts "#{i}. #{selection.two}"
        end
    end

    def main_menu
        input = nil
        while input != "exit"
            puts "Please select from the following:"
            puts ""
            input = gets.chomp.downcase
            if input.to_i > 0
                puts @options[input.to_i-1]
            end
        end
       
    end

    def request_email
        puts ""
        puts ">> What's your email address?"
        gets.chomp
    end

    def verify_email
        puts ""
        puts "#{request_email} ... is this correct?"
        puts ""
        gets.chomp
    end

    def notify_settings
        puts ""
        puts "When do you want to be notified?"
        puts ""
        puts "-----------------------------"
        puts ">>>> waves @ 1-2ft"
        puts ">> waves @ 2-3ft"
        puts ">> waves @ 4-5ft"
        puts ">> waves >= 6ft"
        puts "-----------------------------"
        gets.chomp
    end

    def finalize_notify
        puts ""
        puts "Nice, your notification set. What would you like to do now?"
        puts ""
        puts "return to main menu"
        puts "set another notification"
        gets.chomp
    end

    def next_few_days
        puts ""
        puts <<-DOC.gsub /^\s*/,''
            
        ===========================
        Rockaway Beach, Queens, NY
        ===========================
        ===========================
        Day 1: (Today)
        ===========================
        temp: 87 // H2O temp: 62
        wave: 3-4ft // Rain? No
        ===========================
        ===========================
        Day 2:
        ===========================
        temp: 87 // H2O temp: 62
        wave: 1-2ft // Rain? No
        ===========================
        ===========================
        Day 3:
        ===========================
        temp: 87 // H2O temp: 62
        wave: 2-4ft // Rain? Yes
        DOC
    end

end