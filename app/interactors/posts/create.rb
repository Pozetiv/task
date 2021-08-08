# frozen_string_literal: true

module Posts
  class Create
    include Interactor

    delegate :params, to: :context

    def call
      context.post = post = Post.new(posts_params)
      context.fail!(errors: post.errors.messages) unless post.save
    end

    private

    def user
      context.fail!(errors: { login: 'must be present' }) unless params[:login]

      @user = User.where('lower(login) = ?', params[:login].downcase).first
      @user ||= User.create(login: params[:login])
    end

    def posts_params
      params.merge(user_id: user.id).except(:login)
    end
  end
end
