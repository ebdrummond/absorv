class TargetBehavior < ActiveRecord::Base
  belongs_to :user

  validates :name,
    presence: true,
    uniqueness: { scope: :user_id, message: :duplicate_name }
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
