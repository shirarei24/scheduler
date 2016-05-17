class CalendarController < ApplicationController

  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

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
