require 'sinatra/json'
require 'nokogiri'

require 'open-uri'

class StatusController < Sinatra::Base
	TFL_WEEKEND = 'http://www.tfl.gov.uk/tfl/businessandpartners/syndication/feed.aspx?email=peterhsaxton@gmail.com&feedId=1'
	get '/status/lines' do
		doc = Nokogiri::XML(open(TFL_WEEKEND))
		# json :lines => [
		# 	:bakerloo,
		# 	:central,
		# 	:circle,
		# 	:district,
		# ]
		output = []
		(doc/'//Line').each do |line|
			name = (line/'./Name').text
			status = (line/'./Status')
			msg = (status/'./Text').text
			long = (status/'./Message/Text').text
			output << {name: name, msg: msg, long: long}
		end

		json output
	end
end