class UsersController < ApplicationController
  def index

  end

  def create
    x = 'go'
  end

  def login

  end

  def new
    user =  User.find_by_name(params["name"])
    if user
      render :tabbeer
    else
      render :register
    end

  end

  def register

  end
end
