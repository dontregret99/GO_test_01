class FollowService < ApplicationService
  def initialize(user_id, follower_id)
    @user_id = user_id
    @follower_id = follower_id
  end

  def call
    begin
      follow = Follow.create(user_id: @user_id, follower_id: @follower_id)

      ServiceResponse.new(payload: { success: true, follow: follow })
    rescue StandardError
      ServiceResponse.new(payload: { success: false })
    end
  end
end
