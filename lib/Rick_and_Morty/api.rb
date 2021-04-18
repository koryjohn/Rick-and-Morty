class API
  def self.get_ricks
    response = RestClient.get("https://rickandmortyapi.com/api/character/?name=rick")
    character_array = JSON.parse(response)["results"]
    character_array.each do |character|
      Rick.new(character)
    #binding.pry
    end
end

  def self.get_mortys
    response = RestClient.get("https://rickandmortyapi.com/api/character/?name=morty")
    character_array = JSON.parse(response)["results"]
    character_array.each do |character|
      Morty.new(character)
    #binding.pry
    end
end
end
