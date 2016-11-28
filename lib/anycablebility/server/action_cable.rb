# frozen_string_literal: true
require "anycablebility/server/base"

module Anycablebility
  module Server
    # ActionCable server wrapper
    class ActionCable < Base
      require "rack"
      require "puma"

      def run
        Rack::Handler.default.run ::ActionCable.server
      end

      protected

      def init_channels
        super
        ::ActionCable.server.config.disable_request_forgery_protection = true
      end

      def init_logger
        super
        ::ActionCable.server.config.logger = logger
      end

      def init_pubsub
        ::ActionCable.config.cable = { adapter: "async" }.with_indifferent_access
      end
    end
  end
end
