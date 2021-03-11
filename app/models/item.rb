class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :shipping_id
  belongs_to :shipment_source_id
  belongs_to :shipping_date_id

  
  
has_one :user_item
belongs_to :user
has_one_attached :image






end
