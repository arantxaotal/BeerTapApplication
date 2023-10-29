class UsersController < ApplicationController
  def index

  end

  def create
    x = 'go'
  end

  def login

  end

  def tab_beer_show

  end

  def login_enter
    @user =  User.find_by_name(params[:users][:name])
    if @user and @user&.authenticate(params[:users][:password])
      render :tab_beer_show
    else
      render :register
    end
  end

  def new
    user = User.new(name: params[:users][:name], password: params[:users][:password], password_confirmation: params[:users][:password_confirmation])
    if user.save
      render :login
    else
      render :register
    end
  end

  def register

  end
end
