require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  let(:valid_attributes) do
    attributes_for :activity
  end

  let(:invalid_attributes) do
    { created_at: DateTime.now }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all activities as @activities' do
      activity = Activity.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:activities)).to eq([activity])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested activity as @activity' do
      activity = Activity.create! valid_attributes
      get :show, { id: activity.to_param }, valid_session
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe 'GET #new' do
    it 'assigns a new activity as @activity' do
      get :new, {}, valid_session
      expect(assigns(:activity)).to be_a_new(Activity)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested activity as @activity' do
      activity = Activity.create! valid_attributes
      get :edit, { id: activity.to_param }, valid_session
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Activity' do
        expect do
          post :create, { activity: valid_attributes }, valid_session
        end.to change(Activity, :count).by(1)
      end

      it 'assigns a newly created activity as @activity' do
        post :create, { activity: valid_attributes }, valid_session
        expect(assigns(:activity)).to be_a(Activity)
        expect(assigns(:activity)).to be_persisted
      end

      it 'redirects to the created activity' do
        post :create, { activity: valid_attributes }, valid_session
        expect(response).to redirect_to(Activity.last)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:trigger) { create(:trigger_off) }
      let(:new_attributes) { { trigger_id: trigger.id } }

      it 'updates the requested activity' do
        activity = Activity.create! valid_attributes
        put :update, { id: activity.to_param, activity: new_attributes }, valid_session
        activity.reload
        expect(activity.trigger_id).to eql trigger.id
      end

      it 'assigns the requested activity as @activity' do
        activity = Activity.create! valid_attributes
        put :update, { id: activity.to_param, activity: valid_attributes }, valid_session
        expect(assigns(:activity)).to eq(activity)
      end

      it 'redirects to the activity' do
        activity = Activity.create! valid_attributes
        put :update, { id: activity.to_param, activity: valid_attributes }, valid_session
        expect(response).to redirect_to(activity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested activity' do
      activity = Activity.create! valid_attributes
      expect do
        delete :destroy, { id: activity.to_param }, valid_session
      end.to change(Activity, :count).by(-1)
    end

    it 'redirects to the activities list' do
      activity = Activity.create! valid_attributes
      delete :destroy, { id: activity.to_param }, valid_session
      expect(response).to redirect_to(activities_url)
    end
  end
end
