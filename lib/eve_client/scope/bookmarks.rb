# frozen_string_literal: true

module EveClient
  module Scope
    class Bookmarks

      def read_character_bookmarks
        'esi-bookmarks.read_character_bookmarks.v1'
      end

      def read_corporation_bookmarks
        'esi-bookmarks.read_corporation_bookmarks.v1'
      end
    end
  end
end
