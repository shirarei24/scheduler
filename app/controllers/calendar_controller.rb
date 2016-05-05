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

end
