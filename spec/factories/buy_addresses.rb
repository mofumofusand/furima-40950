FactoryBot.define do
  factory :buy_address do
    token          {'tok_0000'}
    post_code      {'123-4567'}
    area_id        {'2'}
    municipalities {'aaa'}
    block          {'bbb'}
    building_name  {'ccc'}
    phone_number   {'00000000000'}
  end
end
