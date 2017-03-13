class Password
  attr_reader :array, :dictionary, :size
  
  def initialize(size)
    @size = size
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
