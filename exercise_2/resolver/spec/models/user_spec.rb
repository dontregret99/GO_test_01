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
require 'rails_helper'

RSpec.describe User, type: :model do

  # Associations
  it { is_expected.to have_many(:follows).dependent(:destroy) }
  
  # Attributes
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }

  describe 'user does not have any followers or followings' do
    let!(:user) { FactoryBot.create(:user) }

    it 'expected to have no followers' do
      expect(user.followers.count).to eq(0)
    end

    it 'expected to have no followings' do
      expect(user.followings.count).to eq(0)
    end

    it 'expected to have one new follower this month' do
      expect(user.new_followers_in_current_month.count).to eq(0)
    end
  end

  describe 'user has followers and followings' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:follower) { FactoryBot.create(:user) }
    let!(:follow) { Follow.create(user_id: user.id, follower_id: follower.id) }

    it 'expected to have one follower' do
      expect(user.followers.count).to eq(1)
    end

    it 'expected to have one following' do
      expect(follower.followings.count).to eq(1)
    end

    it 'expected to have one new follower this month' do
      expect(user.new_followers_in_current_month.count).to eq(1)
    end
  end
end
