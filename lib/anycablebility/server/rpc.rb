# frozen_string_literal: true
require "anycablebility/server/base"

module Anycablebility
  module Server
    # AnyCable server wrapper
    class RPC < Base
      require "anycable"
      require 'anycable/server'

      def run
        Anycable::Server.start
      end

      protected

      def init_logger
        super
        Anycable.logger = logger
      end

      def init_pubsub
        redis_url = "redis://localhost:6379/5"
        Anycable.config.redis_url = redis_url
      end
    end
  end
end
