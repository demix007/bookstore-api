require 'rails_helper'

RSpec.describe "Categories", type: :request do
  # Initialize test data
  let!(:categories) { create_list(:category, 5)}
  let!(:category_id) { categories.first.id}

  # GET/category
  describe 'GET /categories' do
    before { get '/api/v1/categories'}

    it 'returns categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # POST/category
  describe 'POST /categories' do
    let (:valid_name) { {name: 'hallow'}}

    context 'when the request is valid' do
      before { post '/api/v1/categories', params: valid_name}

      it 'creates a category' do
        expect(json['name']).to eq('hallow')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'When the request is invalid'
    before { post '/api/v1/categories', params: {name: ''} }

    it 'returns a validation error message' do
      expect(response.body)
        .to include("{\"name\":[\"can't be blank\",\"is too short (minimum is 3 characters)\"]}")
    end
  end

  # DELETE /category/:id
  describe 'DELETE /categories/:id' do
    before { delete '/api/v1/categories/:category_id' }

    it 'returns status code 204' do
      expect(response).to have_http_status(404)
    end
  end
  
end
