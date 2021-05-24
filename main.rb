require 'tty-prompt'
require 'tty-table'
require 'colorize'

require_relative './ascii_artwork.rb'
require_relative './drinks.rb'
# require_relative 'order.rb'

prompt = TTY::Prompt.new

table = TTY::Table.new([{"Sake" => ["Dewazakura Sparkling Sake", "120ml", "25"], "Size" => ["Amanoto Junmai Ginjo", "150ml", "50"], "Price"=> ["Houraisen bi Junmai Daiginjo", "150ml", "75"] }])

# Welcome screen 
self.welcome_screen
puts "---------------------Welcome to Nonbei Sake Bar, the best bar in town!--------------------"

# Ask if over 18
puts "Are you over 18? Yes/No"
age = gets.chomp
if age == "yes"
    puts "Welcome to the best sake bar in town!!!"
elsif age == "no"
    puts "Come back when you are older!!!"
else 
    puts "Please answer yes or no!"
end 

puts "What is your name?"
name = gets.chomp  
puts "Please don't get drunk #{name}..."

dewazakura_sparkling = Sake.new("Dewazakura Sparkling Sake", "125ml", "50", "This sparkling sake is clear, light bodied but with more sake character than the ‘fruitier’ styles available. A hint of herb on nose, elegant on palate with delicate dry finish.")
amanoto_ginjo = Sake.new("Amanoto Junmai Ginjo", "150ml", "75", "This Junmai Ginjo has beautiful purity with subtle yeast complexity on the nose. Elegant and fruity but powerful on the palate with a crisp clean finish with zesty citrus.")
houraisen_bi = Sake.new("Houraisen bi", "150ml", "100", "Bi is one of Houraisen’s flagship sake’s. It is a very elegant style of Junmai Daiginjo. It is tank matured for 10 months at 10 degrees in order to have a rounder and more mellow character. It has a nose that indicates sweet fruits. The palate shows a good balance between the gentle acidity and the sweet fruit flavours.")


choices = [
    {name: 'View the Menu', value: 1},
    {name: 'View Sake Information', value: 2},
    {name: 'Order a drink', value: 3},
    {name: 'Exit', value: 4}
]

user_input = prompt.select("Select an action?", choices)
self.clear 

case user_input 
#Displays the sake menu
when 1 
    puts self.welcome_screen
    puts "These are the sake available:"
    puts table.render(:ascii)
    puts "Press any key to go back to the main menu"

when 2 
    choices = prompt.select("What sake would you like to know about?", cycle: true, echo:false) do |menu|
        menu.choice('Dewazakura Sparkling Sake', 1)
        menu.choice('Amanoto Junmai Ginjo', 2)
        menu.choice('Houraisen bi Junmai Daiginjo', 3)
end 

case choices 
    when 1 
        puts "#{dewazakura_sparkling.display_description}"
        return_to_menu
    when 2 
        "#{amanoto_ginjo.display_description}"
    when 3
        "#{houraisen_bi.display_description}"
end 

when 3 
    puts "What would you like to order?"
    choices = prompt.select("What sake would you like to order?", cycle: true, echo:false) do |menu|
        menu.choice('Dewazakura Sparkling Sake', 1)
        menu.choice('Amanoto Junmai Ginjo', 2)
        menu.choice('Houraisen bi Junmai Daiginjo', 3)
    end 
case choices 
    when 1 
       "#{dewazakura_sparkling.display_quantity}"
    end 
when 4
    prompt.select("Select an action?", choices)
end 