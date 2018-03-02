require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/recipe")
require("./lib/category")
require("./lib/tag")
require("shoulda-matchers")
require("pry")
require("pg")

DB = PG.connect({:dbname => "recipe_box_test"})

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipe') do
  @recipes = Recipe.all()
  erb(:recipe_add)
end

post('/recipes') do
  name = params[:name]
  ingredients = params[:ingredients]
  instructions = params[:instructions]
  recipe = Recipe.new({:name => name, :ingredients => ingredients, :instructions => instructions, :id => nil})
  recipe.save()
  @recipes = Recipe.all()
  erb(:recipe_list)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipe_list)
end

get("/recipe_detail/:id") do
  @recipes = Recipe.find(params[:id])
  erb(:recipe_detail)
end

delete('/recipe_detail/:id') do
  @recipe = Recipe.find(params[:id])
  @recipe.delete()
  @recipes = Recipe.all()
  erb(:index)
end

get("/recipe_edit/:id") do
  id = params.fetch("id").to_i()
  @recipe = Recipe.find(params[:id])
  erb(:recipe_edit)
end

patch("/recipe_edit/:id") do
  name = params[:name]
  @recipe = Recipe.find(params[:id])
  @recipe.update({:name => name})
  erb(:recipe_edit)
end
