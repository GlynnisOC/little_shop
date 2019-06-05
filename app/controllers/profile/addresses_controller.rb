class Profile::AddressesController < ApplicationController
  before_action :require_reguser

  def index
    @addresses = Address.all
  end

  def edit
    @user = current_user
    @address = current_user.addresses.first
    @addresses = current_user.addresses
  end

  def update
    address = current_user.addresses.first
    address.update!(address_params)
    redirect_to address_index_path
  end

  def create
    address = Address.create(user: current_user)
    redirect_to address_index_path
  end

  def destroy
    address = Address.find(params[:user_id])
    current_user.addresses.delete(address)
    redirect_to address_index_path
  end

  private

  def address_params
    params.require(:address).permit(:address, :city, :state, :zip, :nickname)
  end

end
