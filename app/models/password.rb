class Password
  include ActiveModel::Model
  
  attr_reader :array, :dictionary, :size
  validates :size, numericality:
                     { only_integer: true, greater_than: 1, less_than: 20 }

  def initialize(size)
    @size = size.to_i
    @dictionary = YAML.load_file("#{Rails.root}/config/dicionario.yml")
    @array = @size.times.map do
       index = Sysrandom.random_number(@dictionary.size)
       @dictionary[index]
    end
  end

  def entropy
    Math::log @dictionary.size**@size, 2
  end  
end
