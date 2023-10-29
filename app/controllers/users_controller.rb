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

    redirect_to tab_beer_show_path(user_id:@user.id,stop:'true')
  end

  def save_finish_date
    set_user
    @user.tab.update_attribute(:finish_date, DateTime.now)
    calculate_total
    redirect_to tab_beer_show_path(user_id:@user.id,stop:'false')
  end
  def reset
    set_user
    @user.tab.update(finish_date: nil,finish_date:nil,total_euros:0,total_minutes:0)
    redirect_to tab_beer_show_path(user_id:@user.id,stop:'false')
  end

  def tab_beer_show
    set_user
    set_stop

  end

  def login_enter
    @user =  User.find_by_name(params[:users][:name])
    if @user and @user&.authenticate(params[:users][:password])
      @stop = false
      redirect_to tab_beer_show_path(user_id:@user.id,stop:'false')
    else
      render :register
    end
  end

  def new
    tab = Tab.create(beer_type_id:params[:users][:beer_type_id])
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

  def set_stop
    @stop = params[:stop]
  end
end
