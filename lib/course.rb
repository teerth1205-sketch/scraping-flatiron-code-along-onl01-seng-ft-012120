require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './list.rb'
require_relative './scraper.rb'



class CLI
 @@selected_movies =[]
  def call
    
    Scrape.new.assign_content
    
    get_input
  
  end 
  
  
  def get_input
   puts "                                                            "
   puts ""
   puts "select 1 for a list of the top 100 movies "
   puts "Or if you have already selected your watchlist movies and would like to see the list enter 2"
   puts ""
    
    input = gets.to_i
   
    if input == 1
      list
    elsif input == 2 
      puts ''
      puts @@selected_movies
      get_input
    else 
      exit!
    end

  end 

  def list
    input = nil
    
    while input != "exit" 
    puts "here is a list of the IMDB top 250 Movies:"
    puts ""
    puts "" 
    puts List.all.map{|l| l.title}
    puts ""
    puts ""
    puts ""
    puts ""
    puts "now select a movie by inputing a number associated to the movie"
    puts ""
    
    input = gets.to_i
   
    @@selected_movies
    
    movie = List.all[input.to_i - 1]
    puts ''
    puts ''
    puts movie.title
    puts 
    puts " #{movie.rating} -------- #{movie.runtime} ---- #{movie.genre}"
    puts ''
    puts ''
    puts "Movie info:"
    puts ''
    puts movie.paragraph
    puts ''
    puts ''
    puts ''
    puts "1 to go back"
    puts "2 to go to the main menu"
    puts "3 to add movie to watchlist"
    puts "4 to view watchlist"
    puts ""
    input = gets.to_i
    if input == 1 
      list
    elsif input == 2 
      get_input
    elsif input == 3
      @@selected_movies << movie.title 
      
    elsif input == 4 
    puts @@selected_movies
    puts""
    puts""
    puts"1. go back"
    puts"2. go home"
    puts"3. clear watchlist"
    puts"" 
    puts""
    input = gets.to_i 
    if input == 1
      list
    elsif input == 2 
      get_input
    elsif input == 3
      @@selected_movies.clear
    else 
      exit!
    end 
    else
      exit!
    end 
   
  end 
 
    
    
  end
  
  
end
CLI.new.call
