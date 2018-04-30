class WalletHistoriesController < ApplicationController
	
	def index
    @wallet_histories = WalletHistory.all
  end

  def show
    @wallet_history = WalletHistory.find(params[:id])
  end

  def new
    @wallet_history = WalletHistory.new
  end

  def create
    @wallet_history = WalletHistory.new(wallet_history_params)
    if @wallet_history.save
      redirect_to wallet_histories_path
    else
      render :new
    end
  end

  def update
    @wallet_history = WalletHistory.update(wallet_history_params)
    if @wallet_history.save
      redirect_to wallet_histories_path
    else
      render :edit
    end
  end

  def edit
    @wallet_history = WalletHistory.find(params[:id])
  end

  def destroy
    WalletHistory.find(params[:id]).destroy
    redirect_to wallet_histories_path
  end

  private

  def wallet_history_params
    params.require(:wallet_history).permit(:transaction_type, :recepient_name, :points)
	end
end
