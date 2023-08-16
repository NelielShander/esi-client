# frozen_string_literal: true

module EveClient
  module Scope
    class Wallet
      def read_character_wallet
        'esi-wallet.read_character_wallet.v1'
      end

      def read_corporation_wallet
        'esi-wallet.read_corporation_wallet.v1'
      end

      def read_corporation_wallets
        'esi-wallet.read_corporation_wallets.v1'
      end
    end
  end
end
