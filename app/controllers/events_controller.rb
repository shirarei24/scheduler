class EventsController < ApplicationController
#  def new
#    params.permit!
#    @event = Event.new

    #respond_to remote: true do |format|
    #  format.html # new.html.erb
    #end
#  end
  require 'repetition_create'
  include RepetitionEvents

  def create
    params.permit!
    if !params[:update_button] && !params[:delete_button] && !params[:delete_all_button] then
      @new_event = Event.new(params[:event])
      @new_event.save
      @event = @new_event

      # For AddMonth
      selected = params[:selected];
      if !selected.nil?
      then
        if !selected.empty?
          then
          @event.week = @event.id
          @event.save
          selected.each do |date|
            if date == "undefined"
              next
            end
            @slash_first = date.index('/')
            @slash_second = date.index('/', @slash_first+1)

            @year = date[0..@slash_first-1]
            @month = date[@slash_first+1...@slash_second]
            @day = date[@slash_second+1..date.length]

            if(@month.first == "0")
               @month.slice!(0)
            end
            if(@day.first == "0")
              @day.slice!(0)
            end

            @mevent = Event.new
            copy_event_almost(@mevent, @event)
            @mevent.start_at = @event.start_at
            @mevent.end_at = @event.end_at
            @mevent.start_at = @mevent.start_at.change(year: @year,
                                      month: @month, day: @day)
            @mevent.end_at = @mevent.end_at.change(year: @year,
                                    month: @month, day: @day)
            puts @mevent.start_at
            puts @mevent.end_at
            @mevent.save
          end
        end
      elsif
       @event.mon==1||@event.tue==1||@event.wed==1||@event.thu==1||@event.fri==1||@event.sat==1||@event.sun==1 then
        @event.week = @event.id
        @event.save
        current_start = @event.start_at.tomorrow
        current_end = @event.end_at.tomorrow
        while current_start.to_date <= @event.deadline do
          @wevent = Event.new
          @wevent.week = @event.id
          @wevent.name = @event.name
          @wevent.start_at = current_start
          @wevent.end_at = current_end
          @wevent.place = @event.place
          @wevent.person = @event.person
          @wevent.baggage = @event.baggage
          @wevent.category = @event.category
          if current_start.wday == 0 && @event.sun==1 then
            @wevent.save
          end
          if current_start.wday == 1 && @event.mon==1 then
            @wevent.save
          end
          if current_start.wday == 2 && @event.tue==1 then
            @wevent.save
          end
          if current_start.wday == 3 && @event.wed==1 then
            @wevent.save
          end
          if current_start.wday == 4 && @event.thu==1 then
            @wevent.save
          end
          if current_start.wday == 5 && @event.fri==1 then
            @wevent.save
          end
          if current_start.wday == 6 && @event.sat==1 then
            @wevent.save
          end
          current_start = current_start.tomorrow
          current_end = current_end.tomorrow
        end
      end
      redirect_to controller: "calendar", action: "index",  id: @event.id, year: params[:event]["start_at(1i)"], month: params[:event]["start_at(2i)"]
    elsif params[:update_button] then
      @event = Event.find_by(:id=>params[:event][:id])
      if @event.present? then
        @event.update(params[:event])
      else
        @event = Event.new(params[:event])
        @event.save
      end
      redirect_to controller: "calendar", action: "index",  id: @event.id, year: params[:event]["start_at(1i)"], month: params[:event]["start_at(2i)"]
    elsif params[:delete_button]
        @event = Event.find_by(:id=>params[:event][:id])
        @event.destroy
        redirect_to controller: "calendar", year: params[:event]["start_at(1i)"], month: params[:event]["start_at(2i)"]
    elsif params[:delete_all_button]
      @event = Event.find_by(:id=>params[:event][:id])
      if !@event.week.nil?
        then
        delete_start = @event.start_at
        @allevent=Event.where(:week=>@event.week)
        @allevent.each do |a|
          if(a.start_at >= delete_start) then a.destroy end
        end
      end
      redirect_to controller: "calendar", year: params[:event]["start_at(1i)"], month: params[:event]["start_at(2i)"]
    end

    #redirect_to '/calendar/id/:event'

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
