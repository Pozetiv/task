# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :login, :created_at, :updated_at

  def login
    object.user.login
  end
end
