class Password
  attr_reader :array, :dictionary
  
  def initialize(size)
    @dictionary = YAML.load_file("#{Rails.root}/config/dicionario.yml")
    @array = size.times.map do
      @dictionary.sample
    end
  end
end
