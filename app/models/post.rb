class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates_presence_of :title,:content

  def active_comments
    comments.where(thrashed:false)
  end
end
