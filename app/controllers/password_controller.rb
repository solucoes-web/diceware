# coding: utf-8
class PasswordController < ApplicationController
  def new
  end

  def create
    size = params[:password][:size]
    @password = Password.new(size)
    
    if @password.valid?
      render :show
    else
      flash[:error] = @password.errors.messages[:size]
      render :new
    end
  end
end
