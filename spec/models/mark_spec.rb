# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mark, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:grade) }
    it { should validate_numericality_of(:grade) }
  end

  describe 'relations' do
    it { should belong_to(:post) }
  end
end
