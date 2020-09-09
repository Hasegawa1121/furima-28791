FactoryBot.define do
  factory :item do
    name { 'MyString' }
    description { 'MyText' }
    category_id { 1 }
    condition_id { 1 }
    postage_payer_id { 1 }
    prefecture_id { 1 }
    handling_id { 1 }
    price { 5000 }

    association :user
  end
end
