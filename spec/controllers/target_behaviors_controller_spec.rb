require "rails_helper"

describe TargetBehaviorsController do
  include_context "logged in as user", :user

  let(:user) { create(:user) }

  describe "GET index" do
    let!(:target_behavior) { create(:target_behavior, user: user) }

    it "renders the index template" do
      get :index, user_id: user.id
      expect(response).to render_template(:index)
    end

    it "assigns @target_behaviors for the current user" do
      create(:target_behavior, user: create(:user))

      get :index, user_id: user.id
      expect(assigns(:target_behaviors)).to match_array([target_behavior])
    end
  end

  describe "GET new" do
    before(:each) { get :new, user_id: user.id }
    specify { expect(response).to render_template(:new) }
  end

  describe "POST create" do
    context "with required parameters" do
      let(:params) { attributes_for(:target_behavior) }

      it "creates a new target behavior" do
        expect {
          post :create, user_id: user.id, target_behavior: params
        }.to change { user.target_behaviors.count }.by(1)
      end

      it "redirects to target behaviors index" do
        post :create, user_id: user.id, target_behavior: params
        expect(response).to redirect_to(target_behaviors_path)
      end
    end

    context "with missing parameters" do
      let(:invalid_behavior) { attributes_for(:target_behavior, name: nil) }

      it "does not create a new target behavior" do
        expect {
          post :create, user_id: user.id, target_behavior: invalid_behavior
        }.to_not change { user.target_behaviors.count }
      end

      it "renders the new template" do
        post :create, user_id: user.id, target_behavior: invalid_behavior
        expect(response).to render_template(:new)
      end
    end
  end
end
