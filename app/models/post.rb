class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :likes_counter,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              message: 'must be an integer greater than or equal to zero'
            },
            on: :create
  validates :comments_counter,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              message: 'must be an integer greater than or equal to zero'
            },
            on: :create

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
