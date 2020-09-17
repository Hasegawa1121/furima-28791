FactoryBot.define do
  factory :purchase do
    postal_code   { '123-4567' }
    prefecture_id { 27 }
    city          { '大阪市鶴見区' }
    addresses     { '鶴見2-24-22' }
    building      { '' }
    phone_number  { '08012345678' }
    
    token { 'abcd1234' }
  end
end
