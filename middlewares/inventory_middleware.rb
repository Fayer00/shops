# frozen_string_literal: true
require 'sidekiq'
require 'faye/websocket'
require 'eventmachine'
require 'json'
require 'redis'
require_relative '../app/lib/inventory/process_inventory'
require_relative '../app/workers/process_inventory_worker'

EM.run {
  #ws = Faye::WebSocket::Client.new(ENV['WEBSOCKET_URL'])
  ws = Faye::WebSocket::Client.new('ws://localhost:8080/')
  ws.on :message do |event|
    message = JSON.parse(event.data)
    new_inventory = Inventory::ProcessInventory.new(message)
    new_inventory.call
  end
}