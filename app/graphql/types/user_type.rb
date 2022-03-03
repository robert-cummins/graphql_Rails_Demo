# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :name, String
    field :posts, [Types::PostType]
    field :posts_count, Integer

    def posts_count
      object.posts.count
    end
  end
end
