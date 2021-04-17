class API
  def self.get_data
    response = RestClient.get("https://rickandmortyapi.com/api/character")
    character_array = JSON.parse(response)["results"]
    character_array.each do |character|
      Character.new(character)
    #binding.pry
end
end