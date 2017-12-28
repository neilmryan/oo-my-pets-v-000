class Owner

	@@all = []

	attr_accessor :name, :pets
	attr_reader :species

	def initialize(species)
		@species = species
		@@all << self
		@pets = {:fishes => [], :dogs => [], :cats => []}
	end

	def self.all
		@@all
	end

	def self.count
		@@all.count
	end

	def self.reset_all
		@@all.clear
	end

	def say_species
		"I am a #{self.species}."
	end

	def pets
		@pets
	end

	def buy_fish(name)
		fish = Fish.new(name)
		self.pets[:fishes] << fish
	end

	def buy_cat(name)
		cat = Cat.new(name)
		self.pets[:cats] << cat
	end

	def buy_dog(name)
		dog = Dog.new(name)
		self.pets[:dogs] << dog
	end

	def walk_dogs
		self.pets[:dogs].collect {|d| d.mood = "happy"}
	end

	def play_with_cats
		self.pets[:cats].collect {|c| c.mood = "happy"}
	end

	def feed_fish
		self.pets[:fishes].collect {|f| f.mood = "happy"}
	end

	def sell_pets
		self.pets.each do |k, v|
			v.each do |a|
				a.mood = "nervous"
			end
		end
		self.pets.clear
	end

	def list_pets
		"I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
	end

end