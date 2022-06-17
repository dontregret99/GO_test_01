# == Schema Information
#
# Table name: follows
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follower_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_follows_on_follower_id  (follower_id)
#  index_follows_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#
class Follow < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
