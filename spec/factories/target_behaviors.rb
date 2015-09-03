FactoryGirl.define do
  factory :target_behavior do
    association :user

    name { Faker::Hacker.ingverb }
    positive false
    goal { "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}" }
    notes { Faker::Hacker.say_something_smart }
  end
end

# == Schema Information
#
# Table name: target_behaviors
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string           not null
#  positive   :boolean          default(FALSE), not null
#  goal       :text
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_target_behaviors_on_user_id  (user_id)
#
