require 'rails_helper'

RSpec.describe Favourite, type: :model do

  subject {
    described_class.new(recipe_id: 1,
                        user_id: 1)
  }

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:recipe).without_validating_presence }
  end


end
