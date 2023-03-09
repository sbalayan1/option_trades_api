class OptionTradesController < ApplicationController
  def index
    @options = OptionTrade.all()
    render json: @options if @options
  end

  def show
    @option = OptionTrade.find_by(id: params[:id])
    return render json: @option, status: :ok if @option
    render json: {errors: ["Could not find option trade with id: #{params[:id]}"]}, status: :not_found
  end

  def create
    @option = OptionTrade.create!(option_trade_params)
    return redirect_to @option, status: :ok if @option
    render json: {errors: ["Could not create new option trade!"]}, status: :unprocessable_entity
  end

  def update
    @option = OptionTrade.find_by(id: params[:id])
    if @option
      @option.update!(option_trade_params)
      return render json: @option, status: :ok
    end

    render json: {errors: ["Could not find option with id: #{params[:id]} to update"]}, status: :not_found
  end

  def destroy
    @option = OptionTrade.find_by(id: params[:id])
    if @option
      @option.destroy
      return render json: {}, status: :ok
    end

    render json: {errors: ["Could not find option with id: #{params[:id]} to delete"]}, status: :not_found
  end

  private

  def option_trade_params
    params.require(:option_trade).permit(*OptionTrade.attributes)
  end

  def destroy_all
    OptionTrades.destroy_all()
    render json: OptionTrades.all(), status: :ok
  end
end
