require "rails_helper"

RSpec.describe ProductDescriptorValuesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/product_descriptor_values").to route_to("product_descriptor_values#index")
    end

    it "routes to #show" do
      expect(get: "/product_descriptor_values/1").to route_to("product_descriptor_values#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/product_descriptor_values").to route_to("product_descriptor_values#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/product_descriptor_values/1").to route_to("product_descriptor_values#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/product_descriptor_values/1").to route_to("product_descriptor_values#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/product_descriptor_values/1").to route_to("product_descriptor_values#destroy", id: "1")
    end
  end
end
