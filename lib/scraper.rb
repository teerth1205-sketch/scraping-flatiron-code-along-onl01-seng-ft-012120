require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './list.rb'



class Scrape
  
  def get_page
    @doc = Nokogiri::HTML(open("https://www.imdb.com/list/ls068082370/"))
      
  end 
  
  def get_content
  self.get_page.css(".lister-item-content")
    
  end 
  
  def assign_content
    
    self.get_content.each do |item|
      list = List.new
      list.title  = item.css(".lister-item-header").text.gsub(/\s+/, " ")
      list.genre = item.css(".genre").text.gsub(/\s+/, "")
      list.paragraph = item.css("p").text.split("\n")[8]
      list.rating = item.css("p").text.split("\n")[1].gsub(/\s+/, "")
      list.runtime = item.css("p").text.split("\n")[3].gsub(/\s+/, " ")
  
    
    end 
  end


end 
Scrape.new.assign_content
#Scrape.new.content_selector
