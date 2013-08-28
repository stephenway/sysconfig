#!/usr/bin/env ruby

require "httparty"
require "nokogiri"
require "rainbow"
require "ostruct"

def show_latest
  response = HTTParty.get("http://news.ycombinator.com")
  if response.body == @previous_body
    return
  end
  @previous_body = response.body

  html = Nokogiri::HTML(response.body)
  items = []
  html.css("td.title a").each do |node|
    unless node.text == "More"
      items << OpenStruct.new(:points => node.parent.parent.next_sibling.css("span").text, :title => node.text, :url => node["href"])
    end
    break if items.size == 10
  end 

  puts "\e[H\e[2J"

  max_width = items.map {|i|
    ["#{i.title} #{i.points}".size, i.url.size]
  }.flatten.max

  puts "Hacker News".ljust(max_width).background("#ff6600").foreground(:black)
  items.each do |item|
    title = (item.title + " ").background("#f6f6ef").color(:black)
    points = "(#{item.points})".rjust(max_width - item.title.size - 1).background("#f6f6ef").color(:red)
    puts "#{title}#{points}"
    puts item.url.ljust(max_width).background("#f6f6ef").color(:blue)
  end
end

loop {
  show_latest
  sleep 60
}
