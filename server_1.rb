require 'sinatra'
require 'nokogiri'

get '/' do
  # "Hello World"
  require 'httparty'
  require 'nokogiri'
  url = "https://miami.craigslist.org/d/software-qa-dba-etc/search/sof"
  response = HTTParty.get url

  html = response.body
  dom = Nokogiri::HTML(html)
  links = dom.css("a.hdrlnk")
  html_lines = [
    "<ul>",
  ]
  list_items = links.map.with_index do |link, i|
    "<li>#{link.to_str}: #{link.to_html}</li>"
  end
  html_lines.concat(list_items)
  html_lines << '</ul>'
  html_lines.join
end

# get '/wyncode' do
#   "Hello Wyncode"
# end
