class Profile::AddressesController < ApplicationController
  before_action :require_reguser

  def edit
    @user = current_user
    @address = current_user.address
  end

  def update
  end

  private
  def address_params
    params.require(:address).permit(:address, :city, :state, :zip, :address_nickname)
  end

end
