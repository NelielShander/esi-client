# frozen_string_literal: true

module EveClient
  module Scope
    class Mail

      def organize_mail
        'esi-mail.organize_mail.v1'
      end

      def read_mail
        'esi-mail.read_mail.v1'
      end

      def send_mail
        'esi-mail.send_mail.v1'
      end
    end
  end
end
