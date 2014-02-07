require 'sinatra/base'

class Router < Sinatra::Base
	get '/' do
		'OK'
	end
end