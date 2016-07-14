require 'json'
require './models/pizza.rb'

class PizzaShop < Sinatra::Base

	get '/pizzas' do
		Pizza.all.to_json
	end

	post '/pizzas' do
		myPizza = JSON.parse(request.body.read)
		pizza = Pizza.create(myPizza)
		{"Done": "Done"}.to_json
	end


	get '/pizzas/:id' do
		Pizza.find([params['id'].to_i]).to_json
	end

	delete '/pizzas/:id' do
		Pizza.destroy([params['id'].to_i])
		{"Done": "Done"}.to_json
	end

	put '/pizzas/:id' do
		myPizza = JSON.parse(request.body.read)
		pizza = Pizza.find(params['id'].to_i)
		pizza.update_attributes(myPizza)
		pizza.to_json
		# myPizza.to_json
	end



end
