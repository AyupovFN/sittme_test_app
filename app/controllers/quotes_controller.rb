class QuotesController < ApplicationController
  def index
    quotes = Quote.all
    render json: quotes
  end

  def create
    quote = Quote.create(text: params[:text])
    render json: quote
  end
end
