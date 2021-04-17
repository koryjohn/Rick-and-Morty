class Character
    attr_accessor :id, :name, :location
    @@all = []

    def initialize(pokemon_hash)
        pokemon_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
    end
    save
end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_selection(pokemon_name)
        self.all.detect do |pokemon|
            pokemon.name == pokemon_name
        end
    end

end