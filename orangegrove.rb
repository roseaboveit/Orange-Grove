require 'colorize'
require "./orangetree.rb"

class Grove
  attr_accessor 
  attr_reader :num_orange_trees, :tree_array, :harvest

  def initialize
    @num_orange_trees = 0
    @tree_array = []
    @harvest = 0
  end

  #Ages the Grove by 1 year
  def one_year_passes
    @tree_array.each do |tree|
      tree.one_year_passes
    end
  end

  #Plants a tree in the Grove
  def plant_a_tree
    new_tree = [OrangeTree.new]
    @tree_array = @tree_array + new_tree
  end

  #Picks all the oranges off of all the trees and stores them in @harvest
  def harvest_oranges
    @tree_array.each do |tree|
      until tree.oranges_on_tree == 0
        tree.pick_an_orange
      end
      @harvest += tree.oranges_to_storage
    end
    puts "You harvested #{@harvest.to_s.white} oranges this year"
  end

  #Removes all dead Orange trees from the Grove
  def cut_dead_trees 
    @tree_array = @tree_array.select{|tree| tree.perished==false}
    puts "Your #{"dead trees".red} have been removed"
  end

end