class LikesController < ApplicationController
  before_action :require_signin
  before_action :find_event

  def create
    # @event = Event.find(params[:event_id])
    @event.likes.create!(user: current_user)
    redirect_to @event
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy if like
    # event = Event.find(params[:event_id])
    redirect_to @event
  end
end
