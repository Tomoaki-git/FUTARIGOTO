class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :choice_counts, dependent: :destroy

  with_options presence: true do
    with_options format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ } do
      validates :password
      validates :password_confirmation
    end

    validates :nickname
  end

end
