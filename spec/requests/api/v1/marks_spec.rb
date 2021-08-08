require 'rails_helper'

RSpec.describe Api::V1::MarksController, type: :request do
  describe '#create' do
    let(:created_post) { create(:post) }
    let(:base_url) { "/api/v1/posts/#{created_post.id}/marks" }

    context 'valide data, save and return value' do
      before { post base_url, params: { grade: 1 } }

      it { expect(response).to have_http_status(200) }
      it { expect(json['avg_grade'].to_i).to eq(Mark.where(post_id: created_post.id).average('grade')) }
    end

    context 'invalide date' do
      it 'grade more that max' do
        post base_url, params: { grade: 100 }

        expect(response).to have_http_status(422)
        expect(json['errors']['grade']).to eq(['must be less than or equal to 5'])
      end

      it 'grade less that min' do
        post base_url, params: { grade: 0 }

        expect(json['errors']['grade']).to eq(['must be greater than or equal to 1'])
      end
    end
  end
end
