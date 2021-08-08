# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Posts::Create, type: :interactor do
  describe 'valid case' do
    context 'standart case' do
      let(:params) do
        {
          content: Faker::Lorem.paragraph,
          title: Faker::Lorem.word,
          login: Faker::Name.unique.name
        }
      end

      let(:result) do
        Posts::Create.call(params: params)
      end

      it { expect(result.success?).to be(true) }
    end

    context 'case with case_sensitive' do
      let!(:post) { create(:post) }

      let(:params) do
        {
          content: Faker::Lorem.paragraph,
          title: Faker::Lorem.word,
          login: post.user.login.upcase
        }
      end

      let(:result) do
        Posts::Create.call(params: params)
      end

      it { expect(result.success?).to be(true) }
      it { expect(Post.count).to eq(1) }
    end
  end

  describe 'invalide case' do
    context 'without login' do
      let(:params) do
        {
          content: Faker::Lorem.paragraph,
          title: Faker::Lorem.word,
          login: nil
        }
      end

      let(:result) do
        Posts::Create.call(params: params)
      end

      it { expect(result.success?).to be(false) }
    end
  end
end
