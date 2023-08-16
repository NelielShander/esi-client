# frozen_string_literal: true

module EveClient
  module Scope
    class Location

      def read_location
        'esi-location.read_location.v1'
      end

      def read_online
        'esi-location.read_online.v1'

      end

      def read_ship_type
        'esi-location.read_ship_type.v1'
      end
    end
  end
end
