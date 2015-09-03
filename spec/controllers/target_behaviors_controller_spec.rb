require "rails_helper"

describe TargetBehaviorsController do
  include_context "logged in as user", :user

  let(:user) { create(:user) }

  describe "GET index" do
    before(:each) { get :index, user_id: user.id }
    specify { expect(response).to render_template(:index) }
  end

  describe "GET new" do
    before(:each) { get :new, user_id: user.id }
    specify { expect(response).to render_template(:new) }
  end

  describe "POST create" do
    context "with required parameters" do
      it "creates a new target behavior" do
        expect { post :create,
          user_id: user.id,
          target_behavior: attributes_for(:target_behavior)
        }.to change { user.target_behaviors.count }.by(1)
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
