# README

 to run the app
`docker-compose build`
`docker-compose run --rm app sh -c "rake db:setup"`
`docker-compose up`

on another terminal run the websocket
`websocketd --port=8080 ruby inventory.rb`

on another terminal run to active listen to broadcasts
`ruby middlewares/inventory_middleware.rb` 

