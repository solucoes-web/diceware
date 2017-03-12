# coding: utf-8
class PasswordController < ApplicationController
  def new
    dictionary = YAML.load_file("#{Rails.root}/config/dicionario.yml")
    @password = []
    5.times do
      @password << dictionary.sample
    end
    @password # no ruby não precisa usar o return
  end
end
