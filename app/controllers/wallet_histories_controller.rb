class WalletHistoriesController < ApplicationController
  def index
    puts 'Inside index'
    @wallet_histories = WalletHistory.all
  end

  def show
    puts 'Inside show'
    @wallet_history = WalletHistory.find(params[:id])
  end

  def new
    puts 'Inside new'
    @wallet_history = WalletHistory.new
  end

  def create
    puts 'Inside create'
    @wallet_history = WalletHistory.new(wallet_history_params)
    if @wallet_history.save
      redirect_to wallet_histories_path
    else
      render :new
    end
  end

  def update
    puts 'Inside update'
    @wallet_history = WalletHistory.update(wallet_history_params)
    if @wallet_history.save
      redirect_to wallet_histories_path
    else
      render :edit
    end
  end

  def edit
    puts 'Inside edit'
    @wallet_history = WalletHistory.find(params[:id])
  end

  def destroy
    puts 'Inside destroy'
    WalletHistory.find(params[:id]).destroy
    redirect_to wallet_histories_path
  end


  private

  def wallet_history_params
    puts 'Inside wallet_history_params'
    params.require(:wallet_history).permit(:transaction_type, :recepient_name, :points)
  end
end