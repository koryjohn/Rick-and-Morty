class CLI
   
    def start    
        puts "Hello there! Welcome to the PokemonGo Shiny-Dex. First, what is your name?"
        #API.get_data
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
            print_pokemon
        elsif selection == "exit"
            exit
        else invalid

        end
    end

    def bye
        puts "Good luck on your Pokemon journey!"
    end

    def invalid
        puts "Something doesn't look right. Please try again."
            menu
    end

    def print_pokemon
        Pokemon.all.each_with_index(1) do |pokemon, index|
            puts "#{index}. #{pokemon}."
    end
        select_pokemon
    end
        
    def select_pokemon
        puts "Please choose your Pokemon."
        selection = user_input
        if Pokemon.find_by_selection(selection)
            pokemon = Pokemon.find_by_selection(selection)
        else 
            pokemon = selection
        end
            pokemon_details(selection)
    end

    def pokemon_details(selection)
        if pokemon == "exit"
            bye
        elsif pokemon.class == Pokemon
            puts ""
            puts ""
            puts "*****************************"
            puts "Name: #{pokemon.name}"
            puts "Location: #{pokemon.location}"
            puts "*****************************"
            puts ""
            puts ""
            puts "Enter y to choose another Pokemon or exit to exit:"
        else
            invalid
        end
    end
   
end