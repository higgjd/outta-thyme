require 'rails_helper'

RSpec.describe User, type: :model do

  # subject {
  #   described_class.new(recipe_id: 1,
  #                       user_id: 1)
  # }

  describe "Associations" do
    it { should have_many(:favourites)}
  end


end
