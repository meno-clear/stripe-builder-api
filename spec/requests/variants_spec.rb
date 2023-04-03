require 'swagger_helper'

RSpec.describe 'variants', type: :request do
  let(:variants) { create_variants}


  let(:products) { create_products}


  before do
    variants
  end

  path '/variants' do
    
    get('list variants') do
      produces 'application/json'

      response(200, 'successful') do

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data[0]['price_in_cents']).to eql(Variant.first.price_in_cents)
          
          expect(data[0]['value_type']).to eql(Variant.first.value_type)
          
          
          expect(data[0]['product_id']).to eql(Variant.first.product_id)
          
        end
      end
    end

    post('create variant') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :variant, in: :body, schema:{
        type: :object,
        properties: {
          variant: {
            type: :object,
            properties: {
            
              price_in_cents: {type: :integer},
            
              value_type: {type: :boolean},
            
            
              product_id: {type: :integer},
            
            }
          }
        },
        required: [
        
          'price_in_cents',
        
          'value_type',
        
        
          'product_id',
        
        ]
      }

      response(201, 'successful') do

        let(:variant) {{variant: {
        
          price_in_cents: 10,
        
          value_type: "Value",
        
        
          product_id: Product.first,
        
        }}}
          
        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['price_in_cents']).to eql(10)
          
          expect(data['value_type']).to eql("Value")
          
        end
      end
    end
  end

  path '/variants/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show variant') do
      produces 'application/json'
      
      response(200, 'successful') do
        let(:id) { variants.id}

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data['price_in_cents']).to eql(Variant.first.price_in_cents)
          
          expect(data['value_type']).to eql(Variant.first.value_type)
          
          
          expect(data['product_id']).to eql(Variant.first.product_id)
          
        end
      end
    end

    patch('update variant') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :variant, in: :body, schema:{
        type: :object,
        properties: {
           variant: {
            type: :object,
            properties: {
            
              price_in_cents: {type: :integer},
            
              value_type: {type: :boolean},
            
            
              product_id: {type: :integer},
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { variants.id}
        let(:variant) {{variant: {
        
          price_in_cents: 300,
        
          value_type: "Updated value",
        
                                    }}}

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['price_in_cents']).to eql(300)
          
          expect(data['value_type']).to eql("Updated value")
          
        end
      end
    end

    put('update variant') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :variant, in: :body, schema:{
        type: :object,
        properties: {
           variant: {
            type: :object,
            properties: {
            
              price_in_cents: {type: :integer},
            
              value_type: {type: :boolean},
            
            
              product_id: {type: :integer},
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { variants.id}
        let(:variant) {{variant: {
          
          price_in_cents: 300,
          
          value_type: "Updated value",
          
                                    }}} 

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['price_in_cents']).to eql(300)
          
          expect(data['value_type']).to eql("Updated value")
          
        end
      end
    end

    delete('delete variant') do
      
      response(204, 'successful') do
        let(:id) { variants.id}

        run_test! do |response|
          expect(response.status).to eql(204)
        end
      end
    end
  end
end
