require("spec_helper")

describe(Recipe) do

  # it("add a recipe object") do
  #     test_recipe = Recipe.create({:name => "Grill Cheese Sandwich"})
  #     tag1 = Tag.create({:tag => "Cheese", :tag_id => tag.id})
  #     tag2 = Tag.create({:tag => "Bread", :tag_id => tag.id})
  #     expect(recipe.tags()).to(eq([tag1, tag2]))
  #   end


    describe(Recipe) do
      it { should have_many(:tags) }
    end

    describe(Recipe) do
      it { should have_many(:categories) }
    end
    


end
