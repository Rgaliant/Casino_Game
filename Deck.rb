class Deck
  # Getter and Setter methods for rank, suit and color
  attr_accessor :cards
 
  # Gets called when you call the new method to create an instance
  # deck = Deck.new
  def initialize
    @ranks = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end
 
  def shuffle_cards
   @cards.shuffle!
  end
  
  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        # Ternary Operator
        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
        @cards << Card.new(@ranks[i], suit, color)
      end
    end
  end
 
   def display_cards
     @cards.shuffle.each do |card|
       puts "#{card.rank} #{card.suit} (#{card.color})"
     end
   end

   def draw(index)
    puts "The #{cards[index].rank} of #{cards[index].suit}"
    return cards[index];
   end

 end

# Instantiate a new deck
# d = Deck.new