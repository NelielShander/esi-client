# frozen_string_literal: true

module EveClient
  module Scope
    class Calendar

      def read_calendar_events
        'esi-calendar.read_calendar_events.v1'
      end

      def respond_calendar_events
        'esi-calendar.respond_calendar_events.v1'
      end
    end
  end
end
