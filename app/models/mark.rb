# frozen_string_literal: true

class Mark < ApplicationRecord
  belongs_to :post

  validates :grade, presence: true,
                    numericality: { less_than_or_equal_to: 5,
                                    greater_than_or_equal_to: 1,
                                    only_integer: true }

  validates :author_id, presence: true
  validates :post_id, uniqueness: { scope: :author_id }
end
