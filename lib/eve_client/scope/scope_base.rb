# frozen_string_literal: true

module EveClient
  module Scope
    class ScopeBase
      attr_reader :request
      def initialize
        @request = ::EveClient::Request.new
      end
    end
  end
end
