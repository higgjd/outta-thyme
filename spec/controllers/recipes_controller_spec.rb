require 'rails_helper'


RSpec.describe RecipesController, type: :controller do
  describe "should go to the index page" do
    it "has a 302 redirection status code" do
      get :index
      expect(response.status).to eq(302)
    end
  end
end
