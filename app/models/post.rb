class Post < ApplicationRecord
belongs_to :user

    validates :title, presence: { message: 'を入力してください。'}
    validates :content, presence: { message: 'を入力してください。'}

end