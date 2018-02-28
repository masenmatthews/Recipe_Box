require("spec_helper")

describe(Recipe) do
  it {should have_and_belong_to_many(:categories)}
  it {should have_and_belong_to_many(:tags)}

  it("converts the first letter of each word to an uppercase letter") do
    recipe = Recipe.create({:name => "apple pie"})
    expect(recipe.titleize_name()).to(eq("Apple Pie"))
  end
end
