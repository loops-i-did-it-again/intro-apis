require "http"

system "clear"
puts "Welcome to the Weather app!"
puts "Enter a city:"
city = gets.chomp

response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&APPID=yourapikey")

weather_data = response.parse

temperature = weather_data["main"]["temp"]
description = weather_data["weather"][0]["description"]

puts "Today in #{city} it is #{temperature} degrees outside with #{description}."