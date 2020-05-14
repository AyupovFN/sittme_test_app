class QuotesController < ApplicationController
  def index
    quotes = QuotesQuery.coll(params)
    render json: quotes, meta: navigation_links(quotes, :quotes_url)
  end

  def create
    quote = Quote.create(text: params[:text])
    render json: quote
  end
end
