class UnfollowService < ApplicationService
  def initialize(follow)
    @follow = follow
  end

  def call
    begin
      @follow.destroy

      ServiceResponse.new(payload: { success: true, follow: follow })
    rescue StandardError
      ServiceResponse.new(payload: { success: false })
    end
  end
end
