class UsersController < ApplicationController
  def index

  end

  def create
    x = 'go'
  end

  def login

  end

  def save_start_date
    set_user
    @user.tab.update_attribute(:start_date, DateTime.now)
    @stop = true
    render :tab_beer_show
  end

  def save_finish_date
    set_user
    @user.tab.update_attribute(:finish_date, DateTime.now)
    calculate_total
    @stop = false
    render :tab_beer_show
  end

  def tab_beer_show
    render :tab_beer_show
  end

  def login_enter
    @user =  User.find_by_name(params[:users][:name])
    if @user and @user&.authenticate(params[:users][:password])
      @stop = false
      render :tab_beer_show
    else
      render :register
    end
  end

  def new
    tab = Tab.create()
    user = User.create(tab_id:tab.try(:id),name: params[:users][:name], password: params[:users][:password], password_confirmation: params[:users][:password_confirmation])
    if user.save
      render :login
    else
      render :register
    end
  end

  def register

  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def calculate_total
    minutes = @user.tab.total_minutes + ((@user.tab.finish_date - @user.tab.start_date) / 1.minutes)
    cost = minutes * 2 #beer prize 2 euros per minute
    @user.tab.update(total_minutes: minutes,total_euros: cost )
  end
end
