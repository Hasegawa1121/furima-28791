class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :handling
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name,             length: { maximum: 40 }
    validates :description,      length: { maximum: 1000 }
    validates :category_id,      numericality: { other_than: 0 }
    validates :condition_id,     numericality: { other_than: 0 }
    validates :postage_payer_id, numericality: { other_than: 0 }
    validates :prefecture_id,    numericality: { other_than: 0 }
    validates :handling_id,      numericality: { other_than: 0 }
    validates :price,            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end
end
