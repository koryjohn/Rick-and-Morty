class CLI
   
    def start    
        puts "Welcome to the Galactic Federation data base. Please state your name:"
        API.get_data
        input = user_input
        greet(input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Right! So, your name is #{name}. #{name}! Would you like to learn more about Shiny Pokemon? Enter y to start search, enter exit to exit:"
        menu
    end

    def menu
        selection = user_input
        if selection == "y"
            print_character
        elsif selection == "exit"
            exit
        else invalid

        end
    end

    def bye
        puts ""
    end

    def invalid
        puts ""
            menu
    end

    def print_character
        Character.all.each_with_index(1) do |character, index|
            puts "#{index}. #{character}."
    end
        select_character
    end
        
    def select_character
        puts "Please choose your Pokemon."
        selection = user_input
        if Character.find_by_selection(selection)
            character = Character.find_by_selection(selection)
        else 
            character = selection
        end
            character_details(selection)
    end

    def character_details(selection)
        if character == "exit"
            bye
        elsif character.class == Character
            puts ""
            puts ""
            puts "*****************************"
            puts "Name: #{character.name}"
            puts "Status: #{character.status}"
            puts "*****************************"
            puts ""
            puts ""
            puts "Enter y to choose another character or exit to exit:"
        else
            invalid
        end
    end
   
end