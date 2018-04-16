require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #index" do
    it "blocks unauthenticated access" do
      sign_in nil
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it "returns http success" do
      sign_in
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  

end
