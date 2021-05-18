#Create a drink class that stores all the sake available 

class Sake
    attr_accessor :name, :size, :price :description
    def initialize(name, size, price, description)
        @name = name                #name of the sake 
        @size = size                
        @price = price
        @description = description  #description of the sake 
    end 

    #displays the name, sizes available, price and description of the menu 

    def display_sake 
        puts "Sake: #{name}"
        puts "Size: #{size}"
        