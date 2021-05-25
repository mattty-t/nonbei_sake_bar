require 'tty-prompt'
require 'tty-table'
require 'colorize'

require_relative './ascii_artwork.rb'
require_relative './drinks.rb'

prompt = TTY::Prompt.new

table = TTY::Table.new([{"Sake".blue => ["Dewazakura Sparkling Sake".red, "120ml", "25"], "Size".blue => ["Amanoto Junmai Ginjo".green, "150ml", "50"], "Price".blue=> ["Houraisen bi Junmai Daiginjo".yellow, "150ml", "75"] }])

# Welcome screen 
self.welcome_screen
puts "---------------------Welcome to Nonbei Sake Bar, the best bar in town!--------------------"

# Ask if over 18
puts "Are you over 18? Yes/No"
age = gets.chomp
age = age.strip.capitalize()
if age == "Yes"
    puts "Welcome to the best sake bar in town!!!"
elsif age == "No"
    puts "Come back when you are older!!!"
        exit 
else 
    puts "Please answer yes or no! or else..."
    age = gets.chomp
    if age == "Yes"
        puts "Welcome to the best sake bar in town!!"
    elsif age == "no"
        puts "please come back when you are older!!!"
        exit 
    else 
        puts "goodbye!"
        exit 
    end 
end 

# ask for user input to get their name 
puts "What is your name?"
name = gets.chomp  
name = name.strip.capitalize()
if name == ""
    puts "I'm asking one last time... please tell me your name!"
    name = gets.chomp
    puts "Now that wasn't hard was it? Thank you for telling me your name #{name}"
end 


#values for the sakes to use for the tty prompt 
dewazakura_sparkling = Sake.new("Dewazakura Sparkling Sake", "125ml", "50", "This sparkling sake is clear, light bodied but with more sake character than the ‘fruitier’ styles available. A hint of herb on nose, elegant on palate with delicate dry finish.")
amanoto_ginjo = Sake.new("Amanoto Junmai Ginjo", "150ml", "75", "This Junmai Ginjo has beautiful purity with subtle yeast complexity on the nose. Elegant and fruity but powerful on the palate with a crisp clean finish with zesty citrus.")
houraisen_bi = Sake.new("Houraisen bi", "150ml", "100", "Bi is one of Houraisen’s flagship sake’s. It is a very elegant style of Junmai Daiginjo. It is tank matured for 10 months at 10 degrees in order to have a rounder and more mellow character. It has a nose that indicates sweet fruits. The palate shows a good balance between the gentle acidity and the sweet fruit flavours.")

#created a menu when user enters and allows them to choose what to do
self.clear 
self.welcome_screen
puts "Please don't get drunk #{name.red} ..."
choices = [
    {name: 'View the Menu', value: 1},
    {name: 'View Sake Information', value: 2},
    {name: 'Order a drink', value: 3},
    {name: 'Exit', value: 4}
]

#takes user input and executes the command 
user_input = prompt.select("Select an option?", choices)
self.clear 

case user_input 
#Displays the sake menu using TTY tables and rendering with ascii
when 1 
    puts self.welcome_screen
    puts "These are the sake available:"
    puts table.render(:ascii)
    puts "Press any key to go back to the main menu"

    #Displays more information about the sake using TTY prompt
when 2 
    choices = prompt.select("What sake would you like to know about?", cycle: true, echo:false) do |menu|
        menu.choice('Dewazakura Sparkling Sake', 1)
        menu.choice('Amanoto Junmai Ginjo', 2)
        menu.choice('Houraisen bi Junmai Daiginjo', 3)
end 

# Displays the selected sake information using TTY prompt 
case choices 
    when 1 
        puts self.welcome_screen
        puts "#{dewazakura_sparkling.display_description}"
        puts "Press any key to go back to the main menu"
    when 2 
        puts self.welcome_screen
        "#{amanoto_ginjo.display_description}"
        puts "Press any key to go back to the main menu"
    when 3
        puts self.welcome_screen
        "#{houraisen_bi.display_description}"
        puts "Press any key to go back to the main menu"
end 

#takes user input of what they want to order 
when 3 
    puts "What would you like to order?"
    choices = prompt.select("What sake would you like to order?", cycle: true, echo:false) do |menu|
        menu.choice('Dewazakura Sparkling Sake', 1)
        menu.choice('Amanoto Junmai Ginjo', 2)
        menu.choice('Houraisen bi Junmai Daiginjo', 3)
    end 

case choices 
    when 1 
        puts "Your order comes to a total of:"
        puts "#{dewazakura_sparkling.display_price}"
        puts "Thank you for your order, #{name} and I hope you enjoy your drink "

    when 2 
        puts "Your order comes to a total of"
        puts "#{amanoto_ginjo.display_price}"
        puts "Thank you for your order #{name} and I hope you enjoy your drink "

    when 3 
        puts "Your order comes to a total of"
        puts "#{houraisen_bi.display_price}"
        puts "Thank you for your order #{name} and I hope you enjoy your drink "
    end 
    when 4
    exit
end 