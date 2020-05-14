30.times do
  Quote.create(text: Faker::Quote.unique.yoda)
end
