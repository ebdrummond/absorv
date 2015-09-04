require "rails_helper"

describe TargetBehavior do
  context "validations" do
    context "name uniqueness by user" do
      let(:user) { create(:user) }
      let(:behavior_name) { "negative self-talk" }

      before { create(:target_behavior, user: user, name: behavior_name) }

      it "allows the same behavior name for different users" do
        another_user = create(:user)

        expect(
          another_user.target_behaviors.build(name: behavior_name)
        ).to be_valid
      end

      it "does not allow the same behavior name for the same user" do
        duplicate_name = user.target_behaviors.build(name: behavior_name)
        failure_message = I18n.t(
          "activerecord.errors.models.target_behavior.attributes.name.duplicate_name"
        )

        expect(duplicate_name).to_not be_valid
        expect(duplicate_name.errors.messages[:name]).to include(failure_message)
      end
    end
  end
end
