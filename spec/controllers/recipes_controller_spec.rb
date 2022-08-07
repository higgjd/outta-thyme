require 'rails_helper'


RSpec.describe RecipesController, type: :controller do
  describe "GET Recipes#index" do
    it "has a 302 redirection status code" do
      get :index
      expect(response.status).to eq(302)
    end

    it "should list all recipe titles" do
      get :index
      # expect(page).to have_content recipes.title
      # expect(response).to include(recipe.title)
    end
  end
end
