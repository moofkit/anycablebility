# frozen_string_literal: true
require "spec_helper"
require "action_cable_client"

describe "single client" do
  it "instantiate connection" do
    EventMachine.run do
      uri = "ws://localhost:3000/cable/"
      client = ActionCableClient.new(uri, 'EchoChannel')
      ok = false
      client.connected { ok = true }
      expect(ok).to be true
    end
  end
end
