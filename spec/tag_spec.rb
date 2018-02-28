require("spec_helper")

describe(Tag) do
  it {should have_and_belong_to_many(:recipes)}
  it {should have_and_belong_to_many(:categories)}
end

describe(Tag) do
  it("validates presence of description") do
    tag = Tag.new({:name => ""})
    expect(tag.save()).to(eq(false))
  end
end
