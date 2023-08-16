# frozen_string_literal: true

module EveClient
  module Scope
    class Contracts

      def read_character_contracts
        'esi-contracts.read_character_contracts.v1'
      end

      def read_corporation_contracts
        'esi-contracts.read_corporation_contracts.v1'
      end
    end
  end
end
