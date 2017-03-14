# coding: utf-8
module PasswordHelper
  def paridade(i)
    i%2 == 0 ? 'par' : 'impar'
  end

  def readable_time(time)
    dias = time/(60*60*24)
    anos = dias/365
    if anos < 1
      "#{dias.round(0)} dias"
    elsif anos < 1000
      "#{anos.round(0)} anos"
    elsif anos < 10**6
      "#{(anos/1000).round(0)} mil anos"
    else
      "#{(anos/10**6).round(0)} milhões de anos"
    end
  end
end
