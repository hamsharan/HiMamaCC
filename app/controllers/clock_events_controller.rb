class ClockEventsController < ApplicationController
  def index
  end

  def show
  end

  def new
    first_name = params[:clock_events][:first_name]
    last_name = params[:clock_events][:last_name]
    clocktype = params[:clock_events][:clock_event]

    user = User.find_or_create_by(first_name:first_name,last_name:last_name)
    ClockEvent.create({user:user,clocktype:clocktype, time:DateTime.now})

    user.clock_events
    render redirect:index
  end

  def edit
  end
end
