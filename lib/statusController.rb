require 'sinatra/json'

class StatusController < Sinatra::Base
	get '/status/lines' do
		json "Dave"
	end
end