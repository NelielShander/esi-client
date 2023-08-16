# frozen_string_literal: true

module EveClient
  module Scope
    class Fleets

      def read_fleet
        'esi-fleets.read_fleet.v1'
      end

      def write_fleet
        'esi-fleets.write_fleet.v1'
      end
    end
  end
end
