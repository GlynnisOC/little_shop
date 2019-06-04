class Profile::AddressesController < ApplicationController
  before_action :require_reguser

  def new
    @address = Address.new
  end

  def index
  end

  def edit
    @user = current_user
    @address = current_user.address
  end

  def update
  end

  def create
    address = Address.create(user: current_user)
    address.save
    redirect_to profile_path
  end

  def destroy
    address = Address.find(params[:id])
  end

end
