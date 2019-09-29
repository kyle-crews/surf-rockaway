class SurfRockaway::CLI
    
    def call
        welcome
        main_menu
    end

    def welcome
        puts ""
        puts "|| Welcome".blue
        puts "|| to".blue
        puts "|| Surf Rockaway".blue
        puts ""
        puts "| Ready to surf? |"
        puts ""
    end

    def main_menu
        prompt = TTY::Prompt.new
        input = ""
        while input != "Exit"
            input = prompt.select('Please select an options below:') do |menu|
                menu.choice 'Current conditions', 'Current'
                menu.choice '3 day forecast', '3 day'
                menu.choice 'Set notification', 'Set notification', disabled: '(in development)'
                menu.choice 'Exit the program', 'Exit'
            end

            if input == "Current"
                puts ""
                SurfRockaway::SurfReport.current
                puts ""
            elsif input == "3 day"
                puts ""
                puts "... and here's 3 days"
                puts ""
            else input == "Exit"
                puts ""
                puts "See you soon!"
                exit
            end
        end
    end
end