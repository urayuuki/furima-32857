class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :shipment_source
  belongs_to :shipping_date

  has_one :user_item
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, presence: { message: " can't be blank" }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: " can't be blank" }

    validates :description, presence: { message: " can't be blank" }
    validates :image, presence: { message: " can't be blank" }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :shipment_source_id
    validates :shipping_date_id
  end

end
