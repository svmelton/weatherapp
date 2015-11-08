#define gem
require 'yahoo_weatherman'
#asks user for zipcode
puts "What is your zipcode?"
zipcode = gets.chomp


#uses gem to get location 
def get_location(location)
  client = Weatherman::Client.new
  client.lookup_by_location(location)
end

#Uses user-entered zipcode to determine weather 
weather = get_location(zipcode)
 
#Converts the day to an integer 
today = Time.now.strftime('%w').to_i
 
#gets forecasts 
weather.forecasts.each do |forecast|
day = forecast['date']
 
#determines which day it is
day_of_week = day.strftime('%w').to_i
 
if day_of_week == today
   dayName = 'Today'
elsif day_of_week == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end

#puts forecast for day
puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
end



