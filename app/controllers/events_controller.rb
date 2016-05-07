class EventsController < ApplicationController
  def new
    params.permit!
    @event = Event.new

    #respond_to remote: true do |format|
    #  format.html # new.html.erb
    #end
  end

  def create
    params.permit!
    @event = Event.new(params[:event])
    @event.save
    #redirect_to '/calendar/id/:event'
    redirect_to controller: "calendar", action: "index",  id: @event.id, year: @event.start_at.year, month: @event.start_at.month
#    respond_to do |format|
#      if @event.save
#        format.any { redirect_to(@event, :notice => 'Event was successfully created.') }
#
#      else
#        format.any { render :action => "new" }
#
#      end
#    end
  end

  def show
    @event = Event.find_by(:id => params[:id])
  end

  def delete
    @event = Event.find_by(:id => params[:event])
    #@event = params[:event]
    if @event.present?
      @event.destroy
    end
    redirect_to '/calendar'
  end

  def update
    params.permit!
    @old_event = params[:id]
    if @old_event.present?
      @old_event.update(params[:event])
      redirect_to controller: "calendar", action: "index",  id: params[:id]
    end
  end
end
