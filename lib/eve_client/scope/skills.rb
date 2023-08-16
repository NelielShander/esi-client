# frozen_string_literal: true

module EveClient
  module Scope
    class Skills

      def read_skillqueue
        'esi-skills.read_skillqueue.v1'
      end

      def read_skills
        'esi-skills.read_skills.v1'
      end
    end
  end
end
