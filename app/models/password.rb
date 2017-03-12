class Password
  def initialize(size)
    @dictionary = YAML.load_file("#{Rails.root}/config/dicionario.yml")
    @array = size.times.map do
      @dictionary.sample
    end
  end

  def array
    @array
  end
end
