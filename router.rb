require 'sinatra/base'
require 'haml'

class Router < Sinatra::Base
	get '/' do
		haml :index
	end
end