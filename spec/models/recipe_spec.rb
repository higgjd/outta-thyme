require 'rails_helper'

RSpec.describe Recipe, type: :model do

  subject {
    described_class.new(title: "Anything",
                        instructions: "Lorem ipsum")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a instructions" do
    subject.instructions = nil
    expect(subject).to_not be_valid
  end

  describe "Validations" do
    it { should validate_presence_of(:instructions) }
    it { should validate_presence_of(:title) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:favourites) }
  end



end
