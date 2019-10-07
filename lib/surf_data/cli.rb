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
        puts "| Ready to surf? |".green
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
                SurfRockaway::SurfReport.multi_day
                puts ""
            else input == "Exit"
                puts ""
                puts ""
                puts "__̴ı̴̴̡̡̡ ̡͌l̡̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴̡ ̡̡͡| ̲▫̲͡ ̲̲͡▫̲̲͡͡ ̲|̡̡̡ ̡ ̴̡ı̴̡̡ ̡͌l̡̡̡̡.___  ... See you soon! "
                puts ""
                exit
            end
        end
    end
end