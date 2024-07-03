FactoryBot.define do
  factory :item do
    name                {'商品名'}
    content             {'商品説明'}
    category_id         {'2'}
    condition_id        {'2'}
    bear_id             {'2'}
    area_id             {'2'}
    number_of_day_id    {'2'}
    price               {'300'}
    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/omurice.png'), filename: 'omurice.png')
    end

  end
end
