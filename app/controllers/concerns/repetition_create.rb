module RepetitionEvents
    extend ActiveSupport::Concern

    included do
      # For CallBack
    end

    def copy_event_almost(copy_enevt, origin_enevt)
      copy_enevt.week = origin_enevt.id
      copy_enevt.name = origin_enevt.name
      copy_enevt.place = origin_enevt.place
      copy_enevt.person = origin_enevt.person
      copy_enevt.baggage = origin_enevt.baggage
      copy_enevt.category = origin_enevt.category
    end
end
