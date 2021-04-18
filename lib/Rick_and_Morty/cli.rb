class CLI
   
    def start    
        puts "Welcome to the Galactic Federation data base. Please state your name:"
        API.get_ricks
        API.get_mortys
        input = user_input
        greet(input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Greetings #{name}. Clearance granted. Enter y to access the Rick and Morty profiler, enter exit to exit:"
        menu
    end

    def menu
        selection = user_input
        if selection == "y"
            rick_or_morty
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

    def rick_or_morty
        puts "For list of all known Rick's enter r, for list of all known Morty's enter m. To exit enter exit."
        selection = user_input
        if selection == "r"
            print_ricks
        elsif selection == "m"
            print_mortys
        elsif selection == "exit"
            bye
        else invalid
        end
    end

    def print_ricks
        Rick.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}."
        end
        select_rick
    end

    def print_mortys
        Morty.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}."
        end
        select_morty
    end

    def select_rick
        puts ""
        puts "Please choose a Rick."
        selection = user_input
        if Rick.find_by_selection(selection)
            character = Rick.find_by_selection(selection)
        else 
            character = selection
        end
            rick_details(character)
    end
  
    def select_morty
        puts ""
        puts "Please choose an Morty."
        selection = user_input
        if Morty.find_by_selection(selection)
            character = Morty.find_by_selection(selection)
        else 
            character = selection
        end
            morty_details(character)
    end
     
    def morty_details(character)
        if character == "exit"
            bye
        elsif character.class == Morty
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
            puts "Enter y to choose another Morty, enter menu to access menu, or enter exit to exit:"
        else
            invalid
        end
        selection = user_input
        if selection == "y"
            print_mortys
        elsif selection == "exit"
            bye
        elsif selection == "menu"
            rick_or_morty
        else 
            invalid
        end
    end

    def rick_details(character)
        if character == "exit"
            bye
        elsif character.class == Rick
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
            puts "Wubba lubba dub dub!"
            puts ""
            puts "*****************************"
            puts ""
            puts "Enter y to choose another rick, enter menu to access menu, or enter exit to exit:"
        else
            invalid
        end
        selection = user_input
        if selection == "y"
            print_ricks
        elsif selection == "exit"
            bye
        elsif selection == "menu"
            rick_or_morty
        else 
            invalid
        end
    end
   
end