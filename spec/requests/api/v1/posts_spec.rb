# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :request do
  describe '#create' do
    let(:post_params) { attributes_for(:post) }
    let(:user_login) { Faker::Name.unique.name }

    context 'valide data' do
      before do
        post '/api/v1/posts', params: { post: post_params.merge(login: user_login) }
      end

      let(:post_attributes) { %w[id title content login created_at updated_at] }

      it { expect(response).to have_http_status(200) }
      it { expect(json.keys <=> post_attributes).to eq(0) }
    end

    context 'invalide data' do
      before do
        post '/api/v1/posts', params: { post: post_params.except(:title).merge(login: user_login) }
      end

      it { expect(response).to have_http_status(422) }
      it { expect(json['errors'].include?('title')).to be true }
    end
  end
end
