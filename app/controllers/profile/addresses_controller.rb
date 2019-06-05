class Profile::AddressesController < ApplicationController
  before_action :require_reguser

  def new
    @address = Address.new
  end

  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params["format"])
  end

  def update
    @address = Address.find(params["format"])
    @address.update!(address_params)
    redirect_to profile_path
  end

  def create
    current_user.addresses.create(address_params)
    redirect_to profile_path
  end

  def destroy
    address = Address.find(params[:id])
    current_user.addresses.delete(address)
    redirect_to profile_path
  end

  private
  def address_params
    # binding.pry
    params.require(:address).permit(:address, :state, :city, :zip, :nickname)
  end

end
