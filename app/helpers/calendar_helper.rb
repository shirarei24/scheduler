module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  # custom options for this calendar
  def event_calendar_opts
    {
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>"    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      # %(<a href="/events/#{event.id}" title="#{h(event.name)}">#{h(event.name)}</a>)
      #%(<a href="/calendar/index/#{event.id}/#{event.start_at.year}/#{event.start_at.month}" title="#{h(event.name)}">#{h(event.name)}</a>)
      #link_to( "ここ！", '#', class: 'open')
      %(<a href="#" class="open" </a>
      <div id="modal" style="display:none;">
        デアルカ
      </div>
      <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
      <script type="text/javascript" src="js/jquery-ui-1.8.11.custom.min.js"></script>
      <script type="text/javascript">
        $(function() {
          $('.open').click(function() {
            $('#modal').dialog({
              modal: true,
              title: 'モーダルダイアログ'
            });
          });
        });
      </script>)
    end
  end
end
