class ProcessInventoryWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: "short_process"

  def perform(inventory_json)
    puts 'Starting ProcessInventoryWorker'
    invetory_params = JSON.parse(inventory_json)

    store = Store.find_or_create_by(name: invetory_params['store'])
    shoe = Shoe.find_or_create_by(name: invetory_params['shoe'])
    inventory = Inventory.where(store: store, shoe: shoe)
    quantity = invetory_params['quantity'].to_i

    if inventory.any?
      inventory.first.update_attribute(:quantity, quantity)
      low_inventory = {store: store.name, shoe: shoe.name, quantity: quantity}
    else
      Inventory.create(store: store, shoe: shoe, quantity: quantity)
    end
  rescue => e
    raise "Inventory Process failed with: #{e}"
  end
end