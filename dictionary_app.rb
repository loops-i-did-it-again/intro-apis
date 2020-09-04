require "http"

while true
  system "clear"
  puts "Welcome to the dictionary app!"
  puts "Enter a word:"
  word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  definition = response.parse[0]["text"]
  puts "Definition: #{definition}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  top_example = response.parse["text"]
  puts "Top example: #{top_example}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  pronunciation = response.parse[0]["raw"]
  puts "Top pronunciation: #{pronunciation}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  system("open", response.parse[0]["fileUrl"])

  puts "Enter q to quit, or any other key to continue"
  user_input = gets.chomp
  if user_input == "q"
    puts "Goodbye!"
    break
  end
end