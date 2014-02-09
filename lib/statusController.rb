require 'sinatra/json'
require 'nokogiri'

require 'open-uri'

class StatusController < Sinatra::Base
	TFL_WEEKEND = 'http://www.tfl.gov.uk/tfl/businessandpartners/syndication/feed.aspx?email=peterhsaxton@gmail.com&feedId=1'
	TRACKER_NET_ROOT = 'http://cloud.tfl.gov.uk/TrackerNet'

	get '/status/weekend' do
		doc = Nokogiri::XML(open(TFL_WEEKEND))

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

	get '/status/lines' do
		doc = Nokogiri::XML(open(TRACKER_NET_ROOT + '/linestatus'))
		output = []
		(doc).each do |line|
			name = (line/'./Line')
			output << {name: name}
			puts "dave"
		end
		json doc
	end
end