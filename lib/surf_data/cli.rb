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
                menu.choice 'Seach by wave size', 'Search'
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
            elsif input == "Search"
                puts "---------------------------------------------------------"
                puts ""
                options = SurfRockaway::Search.wave_options
                options.each.with_index(1) do |wave, i|
                    puts "  #{i}.  #{wave}".green
                end
                #options returns an array of unique wave sizes
                puts ""
                puts "---------------------------------------------------------"
                puts " Enter the number associated with the desired wave size: "
                puts "---------------------------------------------------------"
                # request input, set value to a variable called #input
                input = gets.chomp.to_i
                # set variable called #selection
                selection = options[input-1]
                puts ""
                puts ""
                puts ""
                # accepts #selection variable as an argument for #search_by_size ... in #Search class. Prints results.
                input_size = SurfRockaway::Search.search_by_size(selection)
                return_values = input_size.collect {|day| day.values}.to_a
                puts ""
                puts "== WAVES @ #{selection.green} ============"
                puts ""
                puts return_values
                puts ""
                puts "-------------------------"
                puts ""
            else input == "Exit"
                puts ""
                puts ""
                puts "__̴ı̴̴̡̡̡ ̡͌l̡̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴̡ ̡̡͡| ̲▫̲͡ ̲̲͡▫̲̲͡͡ ̲|̡̡̡ ̡ ̴̡ı̴̡̡ ̡͌l̡̡̡̡.___  ... Thanks! See you soon! "
                puts ""
                exit
            end
        end
    end
end