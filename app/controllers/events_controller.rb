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
    redirect_to '/calendar'

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
    @event = Event.find_by(:id => params[:id])
    @event.destroy
    redirect_to '/calendar'
  end
end
