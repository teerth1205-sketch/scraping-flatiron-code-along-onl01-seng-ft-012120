class List
  attr_accessor :title, :genre, :paragraph, :rating, :runtime
  @@all = []
  
  def initialize
    @@all << self 
  end 
  
  def self.all 
    @@all
 
  end 
  
  
end 