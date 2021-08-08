# frozen_string_literal: true

module Api
  module V1
    class MarksController < ApplicationController
      def create
        result = Marks::Create.call(user_id: current_user_id,
                                    post_id: params[:post_id],
                                    grade: params.permit(:grade)[:grade])

        if result.success?
          render json: { avg_grade: result.avg }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
