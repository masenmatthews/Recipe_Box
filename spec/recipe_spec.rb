require("spec_helper")

describe(Recipe) do
  it {should have_and_belong_to_many(:categories)}
  it {should have_and_belong_to_many(:tags)}
end

describe(Tag) do
  it {should have_and_belong_to_many(:recipes)}
  it {should have_and_belong_to_many(:categories)}
end

describe(Category) do
  it {should have_and_belong_to_many(:recipes)}
  it {should have_and_belong_to_many(:tags)}
end
