class VariantDescriptorValue < ApplicationRecord
  belongs_to :variant_descriptor
  belongs_to :variant
  belongs_to :product
end
