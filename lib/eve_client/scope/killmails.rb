# frozen_string_literal: true

module EveClient
  module Scope
    class Killmails

      def read_corporation_killmails
        'esi-killmails.read_corporation_killmails.v1'
      end

      def read_killmails
        'esi-killmails.read_killmails.v1'
      end
    end
  end
end
