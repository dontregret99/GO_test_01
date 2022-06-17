# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  followers_count :integer          default(0)
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#
class User < ApplicationRecord

  # Associations
  has_many :follows, class_name: "Follow", dependent: :destroy

  def self.top_popular_users
    User.all.order(followers_count: :desc)
  end

  def followers
    self.follows
  end

  def followings
    Follow.all.where(follower_id: self.id)
  end

  def new_followers_in_current_month
    self.follower.where("created_at >= ?", Date.current.beginning_of_month)
  end
end
