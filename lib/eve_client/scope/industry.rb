# frozen_string_literal: true

module EveClient
  module Scope
    class Industry

      def read_character_jobs
        'esi-industry.read_character_jobs.v1'
      end

      def read_character_mining
        'esi-industry.read_character_mining.v1'
      end

      def read_corporation_jobs
        'esi-industry.read_corporation_jobs.v1'
      end

      def read_corporation_mining
        'esi-industry.read_corporation_mining.v1'
      end
    end
  end
end
