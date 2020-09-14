class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :addresses
    validates :phone_number,  format: { with: /\A\d{10,11}\z/ }
  end
  validates :building

end
