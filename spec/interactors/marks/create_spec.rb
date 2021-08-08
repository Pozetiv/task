# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Marks::Create, type: :interactor do
  let(:post) { create(:post) }

  describe 'valide date first mark by new user' do
    context 'valide date first mark by new user' do
      let(:result) do
        Marks::Create.call(post_id: post.id,
                           grade: rand(1..5),
                           user_id: Faker::Internet.uuid)
      end

      it { expect(result.success?).to be(true) }
    end

    context 'user have voted' do
      let(:mark) { create(:mark, grade: rand(1..4)) }
      let(:new_grade) { mark.grade + 1 }

      let(:result) do
        Marks::Create.call(grade: new_grade,
                           post_id: mark.post_id,
                           user_id: mark.author_id)
      end

      it { expect(result.success?).to be(true) }
      it { expect(Mark.where(post_id: mark.post_id, author_id: mark.author_id).count).to eq(1) }
    end
  end

  describe 'invalide case' do
    let(:mark) { create(:mark) }

    context 'without user' do
      let(:result) do
        Marks::Create.call(user_id: nil,
                           grade: rand(1..5),
                           post_id: mark.post_id)
      end

      it { expect(result.success?).to be(false) }
    end

    context 'without ppst' do
      let(:result) do
        Marks::Create.call(post_id: nil,
                           grade: rand(1..5),
                           user_id: mark.author_id)
      end

      it { expect(result.success?).to be(false) }
    end
  end
end
