require "rails_helper"

RSpec.describe VariantDescriptorValuesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/variant_descriptor_values").to route_to("variant_descriptor_values#index")
    end

    it "routes to #show" do
      expect(get: "/variant_descriptor_values/1").to route_to("variant_descriptor_values#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/variant_descriptor_values").to route_to("variant_descriptor_values#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/variant_descriptor_values/1").to route_to("variant_descriptor_values#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/variant_descriptor_values/1").to route_to("variant_descriptor_values#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/variant_descriptor_values/1").to route_to("variant_descriptor_values#destroy", id: "1")
    end
  end
end
