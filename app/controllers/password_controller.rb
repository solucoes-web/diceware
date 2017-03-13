# coding: utf-8
class PasswordController < ApplicationController
  def new
  end
  
  def show
    @password = Password.new params[:size]
    if @password.valid?
      @password
    else
      flash[:error] = @password.errors.messages[:size]
      render :new
    end
  end
end
