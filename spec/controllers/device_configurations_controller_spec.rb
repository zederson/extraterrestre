require 'rails_helper'

RSpec.describe DeviceConfigurationsController, type: :controller do

  let(:device) { create(:device_lampada) }

  let(:valid_attributes) {
    FactoryGirl.attributes_for :device_configuration, device: device
  }

  let(:invalid_attributes) {
    { created_at: DateTime.now }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all device_configurations as @device_configurations" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      get :index, {device_id: device.id}, valid_session
      expect(assigns(:device_configurations)).to eq([device_configuration])
    end
  end

  describe "GET #show" do
    it "assigns the requested device_configuration as @device_configuration" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      get :show, {device_id: device.id,:id => device_configuration.to_param}, valid_session
      expect(assigns(:device_configuration)).to eq(device_configuration)
    end
  end

  describe "GET #new" do
    it "assigns a new device_configuration as @device_configuration" do
      get :new, { device_id: device.id }, valid_session
      expect(assigns(:device_configuration)).to be_a_new(DeviceConfiguration)
    end
  end

  describe "GET #edit" do
    it "assigns the requested device_configuration as @device_configuration" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      get :edit, {device_id: device.id, :id => device_configuration.to_param}, valid_session
      expect(assigns(:device_configuration)).to eq(device_configuration)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DeviceConfiguration" do
        expect {
          post :create, {device_id: device.id, :device_configuration => valid_attributes}, valid_session
        }.to change(DeviceConfiguration, :count).by(1)
      end

      it "assigns a newly created device_configuration as @device_configuration" do
        post :create, {device_id: device.id, :device_configuration => valid_attributes}, valid_session
        expect(assigns(:device_configuration)).to be_a(DeviceConfiguration)
        expect(assigns(:device_configuration)).to be_persisted
      end

      it "redirects to the created device_configuration" do
        post :create, {device_id: device.id, :device_configuration => valid_attributes}, valid_session
        expect(response).to redirect_to(device_device_configurations_path(device, DeviceConfiguration.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved device_configuration as @device_configuration" do
        post :create, {device_id: device.id, :device_configuration => invalid_attributes}, valid_session
        expect(assigns(:device_configuration)).to be_a_new(DeviceConfiguration)
      end

      it "re-renders the 'new' template" do
        post :create, {device_id: device.id, :device_configuration => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { description: 'Cores' } }

      it "updates the requested device_configuration" do
        device_configuration = DeviceConfiguration.create! valid_attributes
        put :update, {device_id: device.id, :id => device_configuration.to_param, :device_configuration => new_attributes}, valid_session
        device_configuration.reload
        expect(device_configuration.description).to eql 'Cores'
      end

      it "assigns the requested device_configuration as @device_configuration" do
        device_configuration = DeviceConfiguration.create! valid_attributes
        put :update, {device_id: device.id, :id => device_configuration.to_param, :device_configuration => valid_attributes}, valid_session
        expect(assigns(:device_configuration)).to eq(device_configuration)
      end

      it "redirects to the device_configuration" do
        device_configuration = DeviceConfiguration.create! valid_attributes
        put :update, {device_id: device.id, :id => device_configuration.to_param, :device_configuration => valid_attributes}, valid_session
        expect(response).to redirect_to(device_device_configuration_path(device, device_configuration))
      end
    end

    context "with invalid params" do
      it "assigns the device_configuration as @device_configuration" do
        device_configuration = DeviceConfiguration.create! valid_attributes
        put :update, {device_id: device.id, :id => device_configuration.to_param, :device_configuration => invalid_attributes}, valid_session
        expect(assigns(:device_configuration)).to eq(device_configuration)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested device_configuration" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      expect {
        delete :destroy, {device_id: device.id, :id => device_configuration.to_param}, valid_session
      }.to change(DeviceConfiguration, :count).by(-1)
    end

    it "redirects to the device_configurations list" do
      device_configuration = DeviceConfiguration.create! valid_attributes
      delete :destroy, {device_id: device.id, :id => device_configuration.to_param}, valid_session
      expect(response).to redirect_to(device_device_configurations_url(device.id))
    end
  end
end
