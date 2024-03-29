# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts

  validates :login, presence: true, uniqueness: { case_sensitive: false }
end
