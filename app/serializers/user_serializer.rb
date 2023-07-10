class UserSerializer < ActiveModel::Serializer
attributes :id, :username, :email, :bio, :created_at
has_many :posts, serializer: PostSerializer

def posts
  if instance_options[:posts]
    instance_options[:posts]
  else
    object.posts.order(created_at: :desc)
  end
end
end