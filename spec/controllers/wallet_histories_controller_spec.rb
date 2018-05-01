
require 'rails_helper'

RSpec.describe WalletHistoriesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end