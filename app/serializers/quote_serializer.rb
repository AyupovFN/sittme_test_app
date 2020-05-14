class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :text
  attribute :created_at, key: :date

  def created_at
    object.created_at.strftime("%d.%m.%Y, %H:%M")
  end
end
