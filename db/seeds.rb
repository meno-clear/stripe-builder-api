# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

puts 'ALL USER DESTROYED'

User.create!(email:'test@gmail.com', password: '123456')
User.create!(email:'test2@gmail.com', password: '123456')

puts 'USER CREATED'


MarketPlacePartner.destroy_all

puts 'ALL MARKET PLACE PARTNER DESTROYED'

MarketPlacePartner.create!(name: 'Loja 1', email: 'loja1@gmail.com', cnpj: '123456789', status: 'active', user_id: 1)
MarketPlacePartner.create!(name: 'Loja 2', email: 'loja2@gmail.com', cnpj: '987654321', status: 'active', user_id: 2)

puts 'MARKET PLACE PARTNER CREATED'

Address.destroy_all
Address.create!(address: 'Abaeté - Vila Tupi', number: '41', city: 'Praia Grande', state: 'SP', latitude: -24.019960, longitude: -46.464760, addressable: MarketPlacePartner.first)
Address.create!(address: 'Abaeté - Vila Tupi', number: '41', city: 'Praia Grande', state: 'SP', latitude: -23.9254967, longitude: -46.4150777, addressable: MarketPlacePartner.last)

Category.destroy_all

puts 'ALL CATEGORY DESTROYED'

Category.create!(name: 'Roupas')

puts 'CATEGORY CREATED'

Product.destroy_all

puts 'ALL PRODUC DESTROYED'

Product.create!(name: 'Camisa Polo', category_id: 1, market_place_partner_id: 1)
Product.create!(name: 'Regata', category_id: 1, market_place_partner_id: 2)

puts 'PRODUC CREATED'

Variant.destroy_all

puts 'ALL VARIANT DESTROYED'

Variant.create!(product_id: 1, price_in_cents: '4700')
Variant.create!(product_id: 2, price_in_cents: '2500')

puts 'VARIANT CREATED'

ProductDescriptor.destroy_all

puts 'ALL PRODUCTDESCRIPTOR DESTROYED'

ProductDescriptor.create!(name: 'Brand')
ProductDescriptor.create!(name: 'Material')

puts 'PRODUCTDESCRIPTOR CREATED'

ProductDescriptorValue.destroy_all

puts 'ALL PRODUCTPRODUCTDESCRIPTOR DESTROYED'

ProductDescriptorValue.create!(product_id: 1, product_descriptor_id: 1, value: 'Lacoste')
ProductDescriptorValue.create!(product_id: 1, product_descriptor_id: 2, value: 'Algodao')

ProductDescriptorValue.create!(product_id: 2, product_descriptor_id: 1, value: 'Reserva')
ProductDescriptorValue.create!(product_id: 2, product_descriptor_id: 2, value: 'Poliester')

puts 'PRODUCTPRODUCTDESCRIPTOR CREATED'

VariantDescriptor.destroy_all

puts 'ALL VARIANTDESCRIPTOR DESTROYED'

VariantDescriptor.create!(name: 'Tamanho')
VariantDescriptor.create!(name: 'Cor')
VariantDescriptor.create!(name: 'Gola V', value_type: 'boolean')

puts 'VARIANTDESCRIPTOR CREATED'

VariantDescriptorValue.destroy_all

puts 'ALL VARIANTDESCRIPTORVALUE DESTROYED'

VariantDescriptorValue.create!(variant_id: 1, variant_descriptor_id: 1, value: 'M', product_id: 1)
VariantDescriptorValue.create!(variant_id: 1, variant_descriptor_id: 2, value: 'Rosa', product_id: 1)
VariantDescriptorValue.create!(variant_id: 1, variant_descriptor_id: 3, boolean_value: true, product_id: 1)

VariantDescriptorValue.create!(variant_id: 2, variant_descriptor_id: 1, value: 'G', product_id: 2)
VariantDescriptorValue.create!(variant_id: 2, variant_descriptor_id: 2, value: 'Preto', product_id: 2)
VariantDescriptorValue.create!(variant_id: 2, variant_descriptor_id: 3, boolean_value: false, product_id: 2)

puts 'VARIANTDESCRIPTORVALUE CREATED'