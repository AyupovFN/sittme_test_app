class ApplicationController < ActionController::API
  private

  def navigation_links(collection, url_method)
    if collection.any?
      {
        prev_link: send(url_method, before: collection.first.id),
        next_link: send(url_method, after: collection.last.id),
      }
    else
      before_id = Integer(params[:before], exception: false)
      after_id = Integer(params[:after], exception: false)

      prev_link = send(url_method, before: after_id - 1) rescue nil
      next_link = send(url_method, after: before_id + 1) rescue nil

      {
        prev_link: prev_link,
        next_link: next_link,
      }.compact
    end
  end
end
