class Profile::AddressesController < ApplicationController
  before_action :require_reguser

  def new
    @address = Address.new
  end

  def index
    @addresses = Address.all
  end

  def edit
    @user = current_user
    @address = current_user.addresses.first
  end

  def update
    # binding.pry
    address = current_user.addresses.first
    address.update!(address_params)
    redirect_to address_index_path
  end

  def create
    address = Address.create(user: current_user)
    redirect_to address_index_path
  end

  def destroy
    address = Address.find(params[:id])
    current_user.addresses.delete(address)
    redirect_to address_index_path
  end

  private

  def address_params
    params.require(:address).permit(:address, :city, :state, :zip, :nickname)
  end

end
