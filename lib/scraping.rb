 require_relative './list.rb'

class  Watchlist
  
  def self.add_movie
    input = gets.to_i -1
  movies = List.all[input]
   selected_movies = []
   selected_movies << movies.title
    
  end 
  
  
end 