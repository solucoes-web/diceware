# coding: utf-8
class PasswordController < ApplicationController
  def new
    @dictionaries = []
    Dictionaries.each_with_index do |dic, i|
      @dictionaries << ["Dicionário com #{(dic.size/1000).round 0} mil palavras", i]
    end
    @dictionaries
  end

  def create
    symbols = params[:symbols][:number]
    size = params[:words][:number]
    dictionary_number = params[:dictionary][:number]
    @password = Password.new(size, symbols, dictionary_number)
    
    if @password.valid?
      render :show
    else
      flash[:error] = @password.errors.messages[:size]
      render :new
    end
  end
end
