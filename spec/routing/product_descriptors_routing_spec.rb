require "rails_helper"

RSpec.describe ProductDescriptorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/product_descriptors").to route_to("product_descriptors#index")
    end

    it "routes to #show" do
      expect(get: "/product_descriptors/1").to route_to("product_descriptors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/product_descriptors").to route_to("product_descriptors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/product_descriptors/1").to route_to("product_descriptors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/product_descriptors/1").to route_to("product_descriptors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/product_descriptors/1").to route_to("product_descriptors#destroy", id: "1")
    end
  end
end
