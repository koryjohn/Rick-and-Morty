class Character
    attr_accessor :name, :species, :status, :gender, :image
    @@all = []

    def initialize(character_hash)
        character_hash.each do |keys, value|
            self.send("#{keys}=", value) if self.respond_to?("#{keys}=")
    end
    save
end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_selection(character_name)
        self.all.detect do |character|
           character.name == character_name
        end
    end

end