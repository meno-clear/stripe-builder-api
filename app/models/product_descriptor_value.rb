class ProductDescriptorValue < ApplicationRecord
  belongs_to :product
  belongs_to :product_descriptor
end
