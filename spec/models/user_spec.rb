# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:login) }
  end

  describe 'relations' do
    it { should have_many(:posts) }
  end
end
