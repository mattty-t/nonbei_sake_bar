require_relative '../Classes/drinks.rb'
require_relative '../Classes/ascii_artwork.rb'


describe Sake do 
it 'should display the sake information' do 
type = "houraisen bi"
size = "150ml"
price = "50"
description = "light and fruity "
sake = Sake.new(type, size, price, description)
expect(sake.type.size.price.description).to eq(type,size,price,description)
end 
