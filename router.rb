require 'sinatra/base'
require 'haml'

require './lib/statusController'

class Router < Sinatra::Base

	get '/' do
		haml :index
	end

	get '/status*' do
		StatusController.call(env)
	end

end