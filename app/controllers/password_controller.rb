# coding: utf-8
class PasswordController < ApplicationController
  def new
    @password = (Password.new 5).array
  end
end
