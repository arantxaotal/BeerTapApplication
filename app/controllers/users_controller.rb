class UsersController < ApplicationController

  def index


  end

  def create
    x = 'go'
  end

  def login

  end

  def editable_user

  end

  def destroy

  end

  def save_start_date
    set_user
    @user.tap.update_attribute(:start_date, DateTime.now)

    redirect_to tap_beer_show_path(user_id:@user.id,stop:'true')
  end

  def save_finish_date
    set_user
    @user.tap.update_attribute(:finish_date, DateTime.now)
    calculate_total
    redirect_to tap_beer_show_path(user_id:@user.id,stop:'false')
  end
  def reset
    set_user
    @user.tap.update(finish_date: nil,finish_date:nil,total_euros:0,total_minutes:0)
    redirect_to tap_beer_show_path(user_id:@user.id,stop:'false')
  end

  def tap_beer_show
    set_user
    set_stop

  end

  def login_enter
    @user =  User.find_by_name(params[:users][:name])
    if @user and @user&.authenticate(params[:users][:password])
      @stop = false
      redirect_to tap_beer_show_path(user_id:@user.id,stop:'false')
    else
      render :register
    end
  end

  def new
    tap = Tap.create(beer_type_id:params[:users][:beer_type_id])
    user = User.create(tap_id:tap.try(:id),name: params[:users][:name], password: params[:users][:password], password_confirmation: params[:users][:password_confirmation])
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
    seconds = @user.tap.total_seconds + ((@user.tap.finish_date - @user.tap.start_date) / 1.seconds)
    cost = (seconds * @user.tap.beer_type.flow_volume) * @user.tap.beer_type.prize_per_litre
    @user.tap.update(total_seconds: seconds,total_euros: cost )
  end

  def set_stop
    @stop = params[:stop]
  end
end
