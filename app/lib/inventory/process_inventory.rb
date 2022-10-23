module Inventory
  class ProcessInventory
    def call
      process_inventory(store: store, shoe: shoe, quantity: quantity)
    end


    private

    attr_reader :quantity, :shoe, :store

    def initialize(message)
      @store = message['store']
      @shoe = message['model']
      @quantity = message['inventory']
    end

    def process_inventory(store: , shoe: , quantity: )
      inventory_json = {
        store: store,
        shoe: shoe,
        quantity: quantity
      }.to_json

      ProcessInventoryWorker.perform_async(inventory_json)
    end


  end
end