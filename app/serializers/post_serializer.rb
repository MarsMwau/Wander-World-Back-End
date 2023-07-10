class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :title, :image, :created_at, :author, :likes, :comments

  def author
    object.user.username
  end

  def likes
    object.likes.count
  end

  def comments
    object.comments.order(created_at: :asc)
  end

  def liked_by_current_user
    current_user.present? && object.likes.exists?(user: current_user)
  end
end