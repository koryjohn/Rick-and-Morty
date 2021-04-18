class CLI
   #Add Welcome method
   #Clean up spacing and line break code
    def start    
        puts "Welcome to the Galactic Federation data base. Please enter your name:"
        puts ""
        API.get_ricks
        API.get_mortys
        input = user_input
        greet(input)
    end

    def user_input
        gets.strip
    end
#Add pause in greeting and exit
    def greet(name)
        puts ""
        puts "Greetings #{name}. Processing..."
        puts ""
        puts "..."
        puts ""
        puts "Clearance granted. Enter y to access the Rick and Morty profiler, enter exit to exit:"
        menu
    end
#See if menu method works in place of extra code
    def menu
        puts ""
        selection = user_input
        if selection == "y"
            rick_or_morty
        elsif selection == "exit"
            exit
        else invalid

        end
    end

    def bye
        puts ""
        puts "..."
        puts "Logout successful. Goodbye"
    end

    def invalid
        puts ""
        puts "Invalid entry. Please try again:"
            menu
    end

    def rick_or_morty
        puts ""
        puts "For list of all known Rick's enter r, for list of all known Morty's enter m. To exit enter exit:"
        puts ""
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
        puts ""
        puts "---------------------------------"
        puts ""
        Rick.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}."
        end
        select_rick
    end

    def print_mortys
        puts ""
        puts "---------------------------------"
        puts ""
        Morty.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}."
        end
        select_morty
    end

    def select_rick
        puts ""
        puts "Please choose a Rick:"
        puts ""
        selection = user_input
        if Rick.find_by_selection(selection)
            character = Rick.find_by_selection(selection)
        else 
            character = selection
        end
            rick_details(character)
            #add invaldid/exit input
    end
  
    def select_morty
        puts ""
        puts "Please choose an Morty:"
        puts ""
        selection = user_input
        if Morty.find_by_selection(selection)
            character = Morty.find_by_selection(selection)
        else 
            character = selection
        end
            morty_details(character)
            #add invalid/exit input
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
            puts ""
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
            puts ""
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