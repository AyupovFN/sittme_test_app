class Quote < ApplicationRecord
  PER_PAGE = 5
  scope :ordered, -> { order(id: :desc) }
  scope :after, -> (id) { ordered.where("id < ?", id) }
  scope :before, -> (id) { order(id: :asc).where("id > ?", id) }
end
