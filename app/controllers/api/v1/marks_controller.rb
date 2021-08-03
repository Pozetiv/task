module Api::V1
  class MarksController < ApplicationController
    before_action
  
    def create
      result = MarksCreate.call(post: post,
                                mark: marks_params[:result])

      if result.success?
        render json: result.respond, status: :ok
      else
        render json: { errors: result.errors }, status: :unprocessable_entity
      end
    end
  
    private
  
    def marks_params
      params.require(:mark).permit(:result)
    end

    def post
      @post ||= Post.find(params[:post_id])
    end
  end
end
