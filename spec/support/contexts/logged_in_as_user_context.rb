shared_context "logged in as user" do |user|
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in send(user)
  end
end
