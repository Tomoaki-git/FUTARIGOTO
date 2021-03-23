require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '投稿できる場合' do
      it '全ての情報が正常に入力できている場合は投稿できる' do
        expect(@post).to be_valid
      end

      it '(:first_choice)がなくても投稿できる' do
        @post.first_choice = ''
        expect(@post).to be_valid
      end

      it '(:second_choice)がなくても投稿できる' do
        expect(@post).to be_valid
      end

      it '(:third_choice)がなくても投稿できる' do
        expect(@post).to be_valid
      end

      it '(:comment)が空欄でも投稿できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿できない場合' do
      it '(:title)がないと投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include( "Title を入力してください。" )
      end

      it '(:content)がないと投稿できない' do
        @post.content = ''
        @post.valid?
        expect(@post.errors.full_messages).to include( "Content を入力してください。" )
      end
    end
  end
end
