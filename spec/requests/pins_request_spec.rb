require 'rails_helper'

RSpec.describe "Pins", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/pins/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/pins/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
