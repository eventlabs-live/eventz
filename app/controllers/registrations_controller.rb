class RegistrationsController < ApplicationController

  before_action :find_event

  def index
    @registrations = @event.registrations
  end

  def new
    @registration = @event.registrations.new
  end

  def create
    @registration = @event.registrations.new(registration_params)
    if @registration.save
      redirect_to event_url(@event),
                  notice: 'Thanks for registering!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:name, :email, :how_heard)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
