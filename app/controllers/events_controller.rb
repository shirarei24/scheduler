class EventsController < ApplicationController
#  def new
#    params.permit!
#    @event = Event.new

    #respond_to remote: true do |format|
    #  format.html # new.html.erb
    #end
#  end

  def create
    params.permit!
    if !params[:update_button] then
      @event = Event.new(params[:event])
      @event.save
    else
      @old_event = Event.find_by(:id=>params[:event][:id])
      if @old_event.present? then
        @old_event.update(params[:event])
        @event = @old_event
      else
        @event = Event.new(params[:event])
        @event.save
      end
    end
    #redirect_to '/calendar/id/:event'
    redirect_to controller: "calendar", action: "index",  id: @event.id, year: params[:event]["start_at(1i)"], month: params[:event]["start_at(2i)"]
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

  def update
    @event.update
  end
  def show
    @event = Event.find_by(:id => params[:id])
  end

  def delete
    @event = Event.find_by(:id => params[:event][:id])
    #@event = params[:event]
    if @event.present?
      @event.destroy
    end
    redirect_to controller: "calendar", year: params[:event]["start_at(1i)"], month: params[:event]["start_at(2i)"]
  end

end
