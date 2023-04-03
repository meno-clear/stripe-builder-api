require "rails_helper"

RSpec.describe VariantDescriptorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/variant_descriptors").to route_to("variant_descriptors#index")
    end

    it "routes to #show" do
      expect(get: "/variant_descriptors/1").to route_to("variant_descriptors#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/variant_descriptors").to route_to("variant_descriptors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/variant_descriptors/1").to route_to("variant_descriptors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/variant_descriptors/1").to route_to("variant_descriptors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/variant_descriptors/1").to route_to("variant_descriptors#destroy", id: "1")
    end
  end
end
