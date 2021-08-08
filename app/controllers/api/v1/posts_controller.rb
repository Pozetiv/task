# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      def create
        result = Posts::Create.call(params: posts_params)

        if result.success?
          render json: result.post, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      private

      def posts_params
        params.require(:post).permit(:login, :title, :content)
      end
    end
  end
end
