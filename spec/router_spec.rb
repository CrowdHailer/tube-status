ENV['RACK_ENV'] = 'test'

require './router'
require 'rack/test'

describe Router do
	include Rack::Test::Methods
	def app
		Router
	end

	it 'should return a response from the root' do
		get '/'
		expect(last_response).to be_ok
	end
end