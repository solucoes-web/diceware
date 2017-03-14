class Password
  include ActiveModel::Model
  
  attr_reader :array, :dictionary, :size, :symbols
  validates :size, numericality:
                     { only_integer: true, greater_than: 1, less_than: 20 }
  validates :symbols, numericality:
                     { only_integer: true, greater_or_equal_than: 0, less_than: 100 }
  
  def initialize(size, symbols, dictionary_number)
    @dictionary = Dictionaries[dictionary_number.to_i]
    @size = size.to_i
    @symbols = symbols.to_i
    @array = @size.times.map do
       index = Sysrandom.random_number(@dictionary.size)
       @dictionary[index]
    end
    @symbols.times do
      index = Sysrandom.random_number(Symbols.length)
      @array << Symbols[index]
    end
  end
  
  def entropy
    Math::log guesses, 2
  end

  def estimated_time
    guesses/(1.4*10**13)
  end
  
  private
  def guesses
    (Symbols.length**@symbols) * (@dictionary.size**@size)
  end
end
