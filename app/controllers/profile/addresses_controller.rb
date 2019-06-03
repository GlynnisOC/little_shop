class Profile::AddressesController < ApplicationController
  before_action :require_reguser

  def new
    @address = Address.new
  end

  def index
    @user = current_user
    @addresses = current_user.addresses
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
    redirect_to address_index_path
    # binding.pry
  end

end
