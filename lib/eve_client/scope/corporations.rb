# frozen_string_literal: true

module EveClient
  module Scope
    class Corporations

      def read_blueprints
        'esi-corporations.read_blueprints.v1'

      end

      def read_contacts
        'esi-corporations.read_contacts.v1'
      end

      def read_container_logs
        'esi-corporations.read_container_logs.v1'
      end

      def read_corporation_membership
        'esi-corporations.read_corporation_membership.v1'
      end

      def read_divisions
        'esi-corporations.read_divisions.v1'
      end

      def read_facilities
        'esi-corporations.read_facilities.v1'
      end

      def read_fw_stats
        'esi-corporations.read_fw_stats.v1'
      end

      def read_medals
        'esi-corporations.read_medals.v1'
      end

      def read_standings
        'esi-corporations.read_standings.v1'
      end

      def read_starbases
        'esi-corporations.read_starbases.v1'
      end

      def read_structures
        'esi-corporations.read_structures.v1'
      end

      def read_titles
        'esi-corporations.read_titles.v1'
      end

      def track_members
        'esi-corporations.track_members.v1'
      end

    end
  end
end
