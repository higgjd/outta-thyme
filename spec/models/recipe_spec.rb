require 'rails_helper'

RSpec.describe Recipe, type: :model do

  it "is valid with valid attributes" do
    recipe = described_class.new
    recipe.title = "Anything"
    recipe.instructions = "Anything"
    expect(recipe).to be_valid
  end

  it "is not valid without a title" do
    recipe = Recipe.new(title: nil)
    expect(recipe).to_not be_valid
  end

  it "is not valid without a description" do
    recipe = Recipe.new(instructions: nil)
    expect(recipe).to_not be_valid
  end
end
