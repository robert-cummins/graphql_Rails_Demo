module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType]

    def users
      User.all
    end

    field :user, Types::UserType do
      argument :id, ID, required: true 
    end

    def user(id:)
      User.find(id)
    end
  end
end
