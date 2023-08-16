# frozen_string_literal: true

module EveClient
  module Scope
    class Assets

      def read_assets
        'esi-assets.read_assets.v1'
      end

      def read_corporation_assets
        'esi-assets.read_corporation_assets.v1'
      end
    end
  end
end