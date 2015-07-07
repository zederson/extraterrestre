require 'rails_helper'

RSpec.describe TriggersController, type: :controller do
  let(:valid_attributes) do
    FactoryGirl.attributes_for :trigger_start
  end

  let(:invalid_attributes) do
    { created_at: DateTime.now }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all triggers as @triggers' do
      trigger = Trigger.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:triggers)).to eq([trigger])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested trigger as @trigger' do
      trigger = Trigger.create! valid_attributes
      get :show, { id: trigger.to_param }, valid_session
      expect(assigns(:trigger)).to eq(trigger)
    end
  end

  describe 'GET #new' do
    it 'assigns a new trigger as @trigger' do
      get :new, {}, valid_session
      expect(assigns(:trigger)).to be_a_new(Trigger)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested trigger as @trigger' do
      trigger = Trigger.create! valid_attributes
      get :edit, { id: trigger.to_param }, valid_session
      expect(assigns(:trigger)).to eq(trigger)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Trigger' do
        expect do
          post :create, { trigger: valid_attributes }, valid_session
        end.to change(Trigger, :count).by(1)
      end

      it 'assigns a newly created trigger as @trigger' do
        post :create, { trigger: valid_attributes }, valid_session
        expect(assigns(:trigger)).to be_a(Trigger)
        expect(assigns(:trigger)).to be_persisted
      end

      it 'redirects to the created trigger' do
        post :create, { trigger: valid_attributes }, valid_session
        expect(response).to redirect_to(Trigger.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved trigger as @trigger' do
        post :create, { trigger: invalid_attributes }, valid_session
        expect(assigns(:trigger)).to be_a_new(Trigger)
      end

      it "re-renders the 'new' template" do
        post :create, { trigger: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { description: 'Teste' }
      end

      it 'updates the requested trigger' do
        trigger = Trigger.create! valid_attributes
        put :update, { id: trigger.to_param, trigger: new_attributes }, valid_session
        trigger.reload
        expect(trigger.description).to eql 'Teste'
      end

      it 'assigns the requested trigger as @trigger' do
        trigger = Trigger.create! valid_attributes
        put :update, { id: trigger.to_param, trigger: valid_attributes }, valid_session
        expect(assigns(:trigger)).to eq(trigger)
      end

      it 'redirects to the trigger' do
        trigger = Trigger.create! valid_attributes
        put :update, { id: trigger.to_param, trigger: valid_attributes }, valid_session
        expect(response).to redirect_to(trigger)
      end
    end

    context 'with invalid params' do
      it 'assigns the trigger as @trigger' do
        trigger = Trigger.create! valid_attributes
        put :update, { id: trigger.to_param, trigger: invalid_attributes }, valid_session
        expect(assigns(:trigger)).to eq(trigger)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested trigger' do
      trigger = Trigger.create! valid_attributes
      expect do
        delete :destroy, { id: trigger.to_param }, valid_session
      end.to change(Trigger, :count).by(-1)
    end

    it 'redirects to the triggers list' do
      trigger = Trigger.create! valid_attributes
      delete :destroy, { id: trigger.to_param }, valid_session
      expect(response).to redirect_to(triggers_url)
    end
  end
end
