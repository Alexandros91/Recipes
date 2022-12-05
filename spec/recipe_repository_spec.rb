require 'recipe_repository'

RSpec.describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes_library.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_library_test' })
    connection.exec(seed_sql)
  end

  describe '#all' do
    it 'returns a list of all recipes' do
      repo = RecipeRepository.new

      recipes =repo.all

      expect(recipes.length).to eq 3

      expect(recipes[0].id).to eq '1'
      expect(recipes[0].name).to eq 'Mosxari Giouvetsi'
      expect(recipes[0].cooking_time).to eq '75'
      expect(recipes[0].rating).to eq '5'

      expect(recipes[1].id).to eq '2'
      expect(recipes[1].name).to eq 'Arni Frikase'
      expect(recipes[1].cooking_time).to eq '90'
      expect(recipes[1].rating).to eq '4'

      expect(recipes[2].id).to eq '3'
      expect(recipes[2].name).to eq 'Fakes'
      expect(recipes[2].cooking_time).to eq '40'
      expect(recipes[2].rating).to eq '4'
    end
  end

  describe '#find' do
    it 'returns Mosxari Giouvetsi as a recipe' do
      repo = RecipeRepository.new

      recipe = repo.find(1)

      expect(recipe.id).to eq '1'
      expect(recipe.name).to eq 'Mosxari Giouvetsi'
      expect(recipe.cooking_time).to eq '75'
      expect(recipe.rating).to eq '5'

      recipe = repo.find(2)

      expect(recipe.id).to eq '2'
      expect(recipe.name).to eq 'Arni Frikase'
      expect(recipe.cooking_time).to eq '90'
      expect(recipe.rating).to eq '4'

      recipe = repo.find(3)

      expect(recipe.id).to eq '3'
      expect(recipe.name).to eq 'Fakes'
      expect(recipe.cooking_time).to eq '40'
      expect(recipe.rating).to eq '4'
    end
  end
end