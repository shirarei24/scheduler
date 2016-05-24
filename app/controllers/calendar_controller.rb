class CalendarController < ApplicationController

  def index
    @today = Array.new(24)
    @tomorrow = Array.new(24)
    @dif = Array.new(24) 
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    from =DateTime.now.at_beginning_of_day
    to = DateTime.tomorrow.at_beginning_of_day
    @today_event = Event.where(start_at: from...to).order(start_at: :asc)

    from2 =DateTime.tomorrow.at_beginning_of_day
    to2 = DateTime.tomorrow.tomorrow.at_beginning_of_day
    @tomorrow_event = Event.where(start_at: from2...to2).order(start_at: :asc)

    @today_event.each do |x|
        @today[x.start_at.hour]=x
        @dif[x.start_at.hour]=x.end_at.hour - x.start_at.hour

    end




    @tomorrow_event.each do |y|
        @tomorrow[y.start_at.hour]=y
  
    end


    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
    if params[:id] then
      @event = Event.find_by(:id => params[:id])
    else
      @event = Event.new
    end
    @new_event = Event.new
    Todo.order("deadline")
    @todos = Todo.all.order("deadline")
    @new_todo = Todo.new
    #event = args[:event]
    #{}%(<a href="/events/#{event.id}/delete">削除</a>)
  end

  def update
    params.permit!
    if params[:delete_button] then
      redirect_to controller: "events", action: "delete", event: params[:event]
    else
      @old_event = Event.find_by(:id=>params[:event][:id])
      if @old_event.present?
        @old_event.update(params[:event])
        redirect_to controller: "calendar", action: "index",  id: params[:event][:id], year: params[:event]["start_at(1i)"], month: params[:event]["start_at(2i)"]
      end
    end
  end

  def todoupdate
    if params[:posts] then
      params[:posts].each do |a|
        if a[:flag] then
          @todo = Todo.find_by(:id=>a[:id])
          @todo.destroy
        end
      end
    end
    #Todo.update(params[:posts][:id],　params[:posts][:flag])
    #flag = session[:order].todo.reload
    redirect_to :action => 'index'
  end

  def todocreate
    params.permit!
    @todo = Todo.new(params[:todo])
    @todo.save
    redirect_to :action => 'index'
  end
end
