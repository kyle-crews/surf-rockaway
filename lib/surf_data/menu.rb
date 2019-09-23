class Menu
    def self.main_menu(list)
        list.each_with_index do |item, index|
            puts "#{index + 1}. #{item.name}"
        end
    end

    def self.display(type, list)
        self.print_all(list)
        input_prompt = "Enter the #{type}'s number, type 'list' to show the #{type} list, or type 'exit':"
        puts input_prompt
        input = nil
        while input != "exit"
          input = gets.chomp.downcase
          if input.to_i > 0 && input.to_i < list.length + 1
            index = input.to_i - 1
            return index
          elsif input == "list"
            self.print_all
          elsif input == "exit"
            puts "Goodbye!"
            exit
          else
            puts "Sorry, I didn't understand that.  #{input_prompt}" 
          end
        end
    end
end