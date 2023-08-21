# frozen_string_literal: true

module EsiClient
  module Configuration
    class Container
      CLIENT_ID = "df1396ccd7ef4997892e41378aa5c779"
      SECRET_KEY = "Rg6OqK55Zd8COrSySH6NwEDIjWpxYafTxpBAycGS"
      CALLBACK_URL = "https://localhost/callback"

      attr_accessor :client_id, :secret_key, :redirect_uri

      def initialize
        reset!
      end

      def reset!
        @client_id = CLIENT_ID
        @secret_key = SECRET_KEY
        @redirect_uri = CALLBACK_URL
      end
    end
  end
end
