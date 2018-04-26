class WalletController < ApplicationController
  before_action :authenticate_user!
  def index
    @wallet = current_user.wallet
  end

  def show
    @wallet = current_user.wallet
  end

  def new
    @wallet = current_user.wallet.new
  end

  def create
    @wallet = current_user.wallet.new(wallet_params)
    if @wallet.save
      redirect_to wallet_path
    else
      render :new
    end
  end

  def update
    @wallet = current_user.wallet.update(wallet_params)
    if @wallet.save
      redirect_to wallet_path
    else
      render :edit
    end
  end

  def edit
    @wallet = current_user.wallet.find(params[:id])
  end

  def destroy
    current_user.wallet.find(params[:id]).destroy
    redirect_to wallet_path
  end

  private

  def wallet_params
    params.require(:wallet).permit(:points, :user_id)
  end
end
