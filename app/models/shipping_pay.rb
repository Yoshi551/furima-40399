class ShippingPay < ActiveHash::Base
  include ActiveModel::Model
  attr_accessor :hoge, :fuga

  def save
  end
end
