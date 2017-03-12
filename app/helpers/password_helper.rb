module PasswordHelper
  def entropy(number_of_words)
    Math::log 6**(5*number_of_words), 2
  end
  
  def paridade(i)
    i%2 == 0 ? 'par' : 'impar'
  end
end
