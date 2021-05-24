#Create a drink class that stores all the sake available 

class Sake
    attr_accessor :type, :size, :price, :description
    
    def initialize(type, quantity, price, description)
        @type = type                #type of sake 
        @size = size        #displays the sizes of available : 150ml, 250ml, btl 
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
        puts "Sizes Available: #{@price}"
    end 

end 

dewazakura_sparkling = Sake.new("Dewazakura Sparkling Sake", "125ml", "50", "This sparkling sake is clear, light bodied but with more sake character than the ‘fruitier’ styles available. A hint of herb on nose, elegant on palate with delicate dry finish.")
amanoto_ginjo = Sake.new("Amanoto Junmai Ginjo", "150ml", "75", "This Junmai Ginjo has beautiful purity with subtle yeast complexity on the nose. Elegant and fruity but powerful on the palate with a crisp clean finish with zesty citrus.")
houraisen_bi = Sake.new("Houraisen bi", "150ml", "100", "Bi is one of Houraisen’s flagship sake’s. It is a very elegant style of Junmai Daiginjo. It is tank matured for 10 months at 10 degrees in order to have a rounder and more mellow character. It has a nose that indicates sweet fruits. The palate shows a good balance between the gentle acidity and the sweet fruit flavours.")
