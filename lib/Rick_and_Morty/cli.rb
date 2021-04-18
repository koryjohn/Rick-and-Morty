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
        puts "Greetings #{name}. Clearance granted. Enter y to access the profiler, enter exit to exit:"
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
        puts "Logout successful. Goodbye"
    end

    def invalid
        puts "Invalid entry. Please try again"
            menu
    end

    def print_character
        Character.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}."
        end
        select_character
    end
        
    def select_character
        puts "Please choose an individual to profile."
        selection = user_input
        if Character.find_by_selection(selection)
            character = Character.find_by_selection(selection)
        else 
            character = selection
        end
            character_details(character)
    end

    def character_details(character)
        if character == "exit"
            bye
        elsif character.class == Character
            puts ""
            puts ""
            puts "*****************************"
            puts "Name: #{character.name}"
            puts "Status: #{character.status}"
            puts "Species: #{character.species}"
            puts "Gender: #{character.gender}"
            puts "Image: #{character.image}"
            puts "*****************************"
            puts ""
            puts ""
            puts "Enter y to choose another individual or exit to exit:"
        else
            invalid
        end
    end
   
end