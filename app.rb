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

DB = PG.connect({:dbname => "recipe_box"})

get('/') do
  erb(:home)
end
