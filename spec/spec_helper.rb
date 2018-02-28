require("rspec")
require("pg")
require("sinatra/activerecord")
require("recipe")

#
# RSpec.configure do |config|
#   config.after(:each) do
#     Survey.all().each() do |task|
#       task.destroy()
#     end
#   end
# end
