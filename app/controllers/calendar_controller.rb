class CalendarController < ApplicationController

  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
    @event = Event.find_by(:id => params[:id])
    #event = args[:event]
    #{}%(<a href="/events/#{event.id}/delete">削除</a>)
  end

  def update
    params.permit!
    @old_event = Event.find_by(:id=>params[:event][:id])
    d = params[:event][:start_at]
    if @old_event.present?
      @old_event.update(params[:event])
      redirect_to controller: "calendar", action: "index",  id: params[:event][:id], year: params[:event]["start_at(1i)"], month: params[:event]["start_at(2i)"]
    end
  end
end
