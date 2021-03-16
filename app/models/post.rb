class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :choice_counts, dependent: :destroy
  belongs_to :user

  acts_as_taggable

  validates :title, presence: { message: 'を入力してください。'}
  validates :content, presence: { message: 'を入力してください。'}

end