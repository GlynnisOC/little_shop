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
    @address = current_user.address
  end

  def update
  end

  def create
    address = Address.create(user: current_user)
    redirect_to address_index_path
  end

  def destroy
    address = Address.find(params[:id])
    # @order_addresses.address_id.each do |ai|
    #
    # end
    current_user.addresses.delete(address)
    redirect_to address_index_path
  end

end
