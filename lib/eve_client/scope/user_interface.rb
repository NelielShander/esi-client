# frozen_string_literal: true

module EveClient
  module Scope
    class UserInterface
      def open_window
        'esi-ui.open_window.v1'
      end

      def write_waypoint
        'esi-ui.write_waypoint.v1'
      end
    end
  end
end
