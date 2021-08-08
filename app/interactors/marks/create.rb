# frozen_string_literal: true

module Marks
  class Create
    include Interactor

    after :count_avg

    delegate :grade, to: :context
    delegate :post_id, to: :context
    delegate :user_id, to: :context

    def call
      mark = Mark.find_or_initialize_by(post_id: post_id, author_id: user_id)
      mark.grade = grade
      context.fail!(errors: mark.errors.messages) unless mark.save
    end

    private

    def count_avg
      context.avg = Mark.where(post_id: post_id).average('grade')
    end
  end
end
