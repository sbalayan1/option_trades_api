class OptionTradesController < ApplicationController
  def index
    options = OptionTrade.all()
    render json: options
  end

  # def show,
  # end

  # def create
  #   render json: 
  # end

  # def update,
  # end

  # def destroy
  # end
end
