#Create a drink class that stores all the sake available 

class Sake
    attr_accessor :type, :size, :price, :description
    
    def initialize(type, size, price, description)
        @type = type                #type of sake 
        @size = size        #displays the size of sake  
        @price = price              #price of each size 
        @description = description  #description of the sake 
    end 

    #displays the name, sizes available, price and description of the menu 
    def display_sake 
        puts "Type: #{@type}"
        puts "Size: #{@size}"
        puts "Price: #{@price}"
        puts "Description: #{@description}"
    end 

    #displays the description of the sake 

    def display_description
        puts " Description: #{@description}"
    end 

    def display_size
        puts "How many would you like?: #{@size}"
    end

     # displays the price 
     def display_price 
        puts 
        puts "#{@price} AUD"
    end 

end 
