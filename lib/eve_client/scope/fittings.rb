# frozen_string_literal: true

module EveClient
  module Scope
    class Fittings

      def read_fittings
        'esi-fittings.read_fittings.v1'
      end

      def write_fittings
        'esi-fittings.write_fittings.v1'
      end
    end
  end
end
