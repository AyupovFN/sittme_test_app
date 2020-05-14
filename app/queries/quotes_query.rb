class QuotesQuery
  def self.coll(params)
    new(params).coll
  end

  def initialize(params)
    @before = Integer(params[:before], exception: false)
    @after = Integer(params[:after], exception: false)
  end

  def coll
    if @after.present?
      Quote.after(@after).limit(Quote::PER_PAGE)
    elsif @before.present?
      Quote.before(@before).limit(Quote::PER_PAGE).reverse
    else
      Quote.ordered.limit(Quote::PER_PAGE)
    end
  end
end
