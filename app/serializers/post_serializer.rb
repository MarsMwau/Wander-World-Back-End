class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image
  has_many :comments
  has_many :likes
end
