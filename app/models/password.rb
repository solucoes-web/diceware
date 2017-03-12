class Password
  attr_reader :array, :dictionary
  
  def initialize(size)
    @dictionary = YAML.load_file("#{Rails.root}/config/dicionario.yml")
    @array = size.times.map do
       index = Sysrandom.random_number(@dictionary.size)
       @dictionary[index]
    end
  end
end
