require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '新規投稿' do
    context '投稿できる場合' do
      it '全ての情報が正常に入力できている場合は投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントできない場合' do
      it '(:content)がないとコメントできない' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include( "Comment can't be blank" )
      end
    end
  end
end
