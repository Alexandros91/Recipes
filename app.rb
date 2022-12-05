require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipes_library')

recipe_repository = RecipeRepository.new

recipe_repository.all.each do |recipe|
  puts "#{recipe.name} - #{recipe.cooking_time} min - #{recipe.rating} rating"
end

recipe = recipe_repository.find(2)

puts "#{recipe.name} - #{recipe.cooking_time} min - #{recipe.rating} rating"
