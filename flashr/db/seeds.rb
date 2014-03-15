require 'csv'  # => true


module Parser

  def self.parse(file, name)
    deck = Deck.create(:name => name)                                                                                                     # ~> NoMethodError: undefined method `create' for Deck:Class
    CSV.foreach(File.open(filename=File.dirname(__FILE__) + "/../db/#{file}"), :headers => true, :header_converters => :symbol) do |row|
      Card.create!(:question => row[:question], :answer => row[:answer], :deck_id => deck.id)
    end
  end
end

Parser.parse('state-capitals.csv', "State Capitals")
Parser.parse('world_capitals.csv', "World Capitals")



