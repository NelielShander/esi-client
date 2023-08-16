# frozen_string_literal: true

module EveClient
  module Scope
    class Markets

      def read_character_orders
        'esi-markets.read_character_orders.v1'
      end

      def read_corporation_orders
        'esi-markets.read_corporation_orders.v1'
      end

      def structure_markets
        'esi-markets.structure_markets.v1'
      end
    end
  end
end
