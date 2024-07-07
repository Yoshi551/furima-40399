# app/models/shipping_address.rb
class ShippingAddress < ApplicationRecord
  belongs_to :order
end
