class DinosaurSerializer

	def initialize(dinosaur_object, target = nil)
		@dinosaur = dinosaur_object
		@serialzier = method(:serialize_dinosaur)
	end

	def serialize
		@serialzier.call
	end

	def serialize_dinosaur
		Protos::Dinosaur::Dinosaur.new(
			name: @dinosaur.name,
			species: @dinosaur.species,
			diet: @dinosaur.diet,
		)
	end
end
