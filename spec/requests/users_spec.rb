require 'rails_helper'

RSpec.describe "Users", type: :request do
  include Committee::Rails::Test::Methods

  def committee_options
    @committee_options ||= { schema_path: Rails.root.join('api', 'user.json').to_s }
  end
  # include Committee::Rails::Test::Methods
  #
  # def committee_options
  #   @committee_options ||= { schema_path: Rails.root.join('api', 'user.json').to_s }
  # end

  # describe "GET /users" do
  #   it "works! (now write some real specs)" do
  #     get "/users"
  #     expect(response).to have_http_status(200)
  #     assert_schema_conform
  #   end
  # end
  describe 'GET /users/:id' do
    let!(:user) { create(:user) }

    it 'レスポンスがAPI定義と一致する' do
      get "/users/#{user.id}"
      assert_schema_conform
    end
  end
end
