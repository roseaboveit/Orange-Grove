require 'colorize'
class OrangeTree
  attr_accessor :age, :oranges_on_tree, :oranges_to_storage, :height, :perished

  def initialize
    @age = 0
    @height = 0
    @oranges_to_storage = 0
    @oranges_on_tree = 0
    @perished = false
  end

  # Calculate and grows the tree by 1 year
  def calc_height
    if @perished == false
      case @height
      when (0..10.0)
        @height += rand(1..2.5)
      when (10.0..30.0) 
        @height += rand(0.5..1.5)
      when (30.0..49.0) 
        @height += rand(0.3..0.8)
      when (49.0..50.0) 
        @height
      end
    else
      puts "Your tree is still dead but was #{@height} at time of death"
    end
  end

  # Ages the tree by 1 year
  def one_year_passes
    @age += 1
    if @perished == false
      if @age >150
        @perished = true
        puts "This tree has perished".red
        count_the_oranges
      elsif rand(0..100)>99
        @perished = true
        puts "This tree has perished".red
        count_the_oranges
      else
        @oranges_to_storage = 0
        puts "Note: Any unused oranges have spoiled".yellow
        calc_height
        count_the_oranges
        @age
      end
    else
      puts "Your tree is still dead".red.bold
      count_the_oranges
    end 
  end

  # Calculates the oranges on the tree for the year
  def count_the_oranges
    
    if @perished == false
      case @age
      when (0..3)
        @oranges_on_tree = 0
      when (3..5)
        @oranges_on_tree = rand(5..50)
      when (5..10)
        @oranges_on_tree = rand(25..100)
      else
        @oranges_on_tree = rand(75..200)
      end 
    
    else
      
      @oranges_on_tree = 0
      puts "Your tree is still dead and so produced no fruit".red.bold
    
    end
  end

  # Picks one orange and puts it in storage
  def pick_an_orange
    unless @oranges_on_tree <= 0
      @oranges_on_tree -= 1
      @oranges_to_storage += 1
    end
  end
end