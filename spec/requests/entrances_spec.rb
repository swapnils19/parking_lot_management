require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/entrances", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Entrance. As you add validations to Entrance, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Entrance.create! valid_attributes
      get entrances_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      entrance = Entrance.create! valid_attributes
      get entrance_url(entrance)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_entrance_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      entrance = Entrance.create! valid_attributes
      get edit_entrance_url(entrance)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Entrance" do
        expect {
          post entrances_url, params: { entrance: valid_attributes }
        }.to change(Entrance, :count).by(1)
      end

      it "redirects to the created entrance" do
        post entrances_url, params: { entrance: valid_attributes }
        expect(response).to redirect_to(entrance_url(Entrance.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Entrance" do
        expect {
          post entrances_url, params: { entrance: invalid_attributes }
        }.to change(Entrance, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post entrances_url, params: { entrance: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested entrance" do
        entrance = Entrance.create! valid_attributes
        patch entrance_url(entrance), params: { entrance: new_attributes }
        entrance.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the entrance" do
        entrance = Entrance.create! valid_attributes
        patch entrance_url(entrance), params: { entrance: new_attributes }
        entrance.reload
        expect(response).to redirect_to(entrance_url(entrance))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        entrance = Entrance.create! valid_attributes
        patch entrance_url(entrance), params: { entrance: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested entrance" do
      entrance = Entrance.create! valid_attributes
      expect {
        delete entrance_url(entrance)
      }.to change(Entrance, :count).by(-1)
    end

    it "redirects to the entrances list" do
      entrance = Entrance.create! valid_attributes
      delete entrance_url(entrance)
      expect(response).to redirect_to(entrances_url)
    end
  end
end
