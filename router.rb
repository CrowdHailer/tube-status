require 'sinatra/base'
require 'haml'

class Router < Sinatra::Base
	set :static, true
	# set :public_dir, 'public'
	# set :app_file, __FILE__
	# set :root, File.dirname(__FILE__)

	get '/' do
		haml :index
	end

	get "/public/stylesheets/reset.css" do
	  content_type 'text/css'
	  # sass :"/stylesheets/sass/reset.sass"
	  "body { background: green; }"
	  # send_file('reset.css')
	end
end