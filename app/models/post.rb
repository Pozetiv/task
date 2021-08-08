# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :marks

  validates :content, :title, presence: true
end
