# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
  end

  describe 'relations' do
    it { should belong_to(:user) }
    it { should have_many(:marks) }
  end
end
