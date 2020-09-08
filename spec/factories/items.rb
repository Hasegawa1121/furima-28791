FactoryBot.define do
  factory :item do
    user { nil }
    name { "MyString" }
    description { "MyText" }
    image { "MyString" }
    category_id { 1 }
    condition_id { 1 }
    postage_payer_id { 1 }
    prefecture_id { 1 }
    handling_id { 1 }
    price { 1 }
  end
end
