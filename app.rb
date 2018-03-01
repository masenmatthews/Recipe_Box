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
  instructions = params.fetch[:instructions]
  #binding.pry
  recipe = Recipe.new({:name => name, :ingredients => ingredients, :instructions => instructions, :id => nil})
  recipe.save()
  @recipes = Recipe.all()
  erb(:recipe_list)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipe_list)
end

post('/clear') do
  Recipe.clear
  redirect '/'
  erb(:index)
end

get("/recipe_list/:id") do
  @recipe = Recipe.find(params[:id])
  erb(:recipe_edit)
end

patch("/recipe_list/:id") do
  name = params[:name]
  @recipe = Recipe.find(params[:id])
  @recipe.update({:name => name})
  erb(:recipe_edit)
end
