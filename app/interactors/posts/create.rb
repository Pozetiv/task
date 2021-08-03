class Posts::Create
  include Interactor

  delegate :params, to: :context

  def call
    context.post = post = Post.new(posts_params)

    context.fail!(errors: post.errors.messages) unless post.save
  end

  private

  def user
    @user = User.find_or_create_by(login: params[:login])
  end

  def posts_params
    params.merge(user_id: user.id).except(:login)
  end
end
