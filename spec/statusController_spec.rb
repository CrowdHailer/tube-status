ENV['RACK_ENV'] = 'test'

require './lib/statusController'
require 'rack/test'

describe StatusController do
	include Rack::Test::Methods
	def app
		StatusController
	end

	it 'should return a response for line status query' do
		get '/status/lines'
		expect(last_response).to be_ok
	end

	it 'should return JSON data' do
		get '/status/lines'
		expect(last_response.content_type).to eq('application/json;charset=utf-8')
	end
end