# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  let!(:first_restaurant) { create(:restaurant, :with_ratings, name: 'Hard Rock Cafe') }
  let!(:second_restaurant) { create(:restaurant, :with_ratings, ratings_count: 5, name: 'Mandarin') }
  let!(:closed_restaurant) { create(:restaurant, :closed) }

  describe '#index' do
    render_views

    before do
      get :index
    end

    specify 'successfull response' do
      expect(response).to be_successful
    end

    specify 'assigns correct records' do
      expect(assigns(:restaurants)).to match_array([first_restaurant, second_restaurant])
    end
  end

  describe '#show' do
    render_views

    it 'successfull' do
      get :show, params: { id: first_restaurant.to_param }

      expect(response).to be_successful

      expect(assigns(:restaurant)).to eq(first_restaurant)
    end
  end

  describe '#rate' do
    specify 'creates rating' do
      expect { post :rate, xhr: true, params: { id: first_restaurant.id, rating: 5 } }
        .to change(first_restaurant.ratings, :count).by(1)
    end
  end

  describe '#search' do
    specify 'creates rating' do
      get :index, xhr: true, params: { search: { query: 'Rock' } }

      expect(assigns(:restaurants)).to match_array([first_restaurant])
    end
  end
end
