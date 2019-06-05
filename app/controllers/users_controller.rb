class UsersController < ApplicationController
  before_action :require_reguser, except: [:new, :create]

  def new
    @user = User.new
    @user.addresses.build
  end

  def show
    @user = current_user
    @addresses = current_user.addresses
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    @user.address = 0
    @user.city = 0
    @user.state = 0
    @user.zip = 0
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Registration Successful! You are now logged in."
      redirect_to profile_path
    else
      flash.now[:danger] = @user.errors.full_messages
      @user.update(email: "", password: "")
      render :new
    end
  end

  def update
    @user = current_user
    @user.update(user_update_params)
    if @user.save
      flash[:success] = "Your profile has been updated"
      redirect_to profile_path
    else
      flash.now[:danger] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, addresses_attributes: [:address, :city, :state, :zip,])
  end

  def user_update_params
    uup = user_params
    uup.delete(:password) if uup[:password].empty?
    uup.delete(:password_confirmation) if uup[:password_confirmation].empty?
    uup
  end
end
