require 'open-uri'
require 'nokogiri'

puts "Please enter an ingredient"
ingredient = gets.chomp
url = "https://www.bbcgoodfood.com/search?q=#{ingredient}"

html_file = URI.open(url).read

html_doc = Nokogiri::HTML(html_file)

search_results = html_doc.search(".standard-card-new__article-title")
search_results.each do |search_result|
  puts search_result.text.strip
  puts search_result.attribute("href").value
end