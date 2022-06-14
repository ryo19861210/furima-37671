require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '全て存在すれば出品できる' do
        expect(@item).to be_valid
      end

      context '商品が出品できない場合' do
        it '商品画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が空では登録できない' do
          @item.profile = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Profile can't be blank")
        end
        it 'カテゴリーが未選択では登録できない' do
          @item.category_genre_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category genre must be other than 1')
        end
        it '商品の状態が未選択では登録できない' do
          @item.status_genre_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status genre must be other than 1')
        end
        it '配送料の負担が未選択では登録できない' do
          @item.send_price_genre_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Send price genre must be other than 1')
        end
        it '発送元の地域が未選択では登録できない' do
          @item.place_genre_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Place genre must be other than 1')
        end
        it '発送までの発送までの日数が未選択では登録できない' do
          @item.scheduled_day_genre_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Scheduled day genre must be other than 1')
        end
        it '販売価格が空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '販売価格は半角数字以外では登録できない' do
          @item.price = '２０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '販売価格は¥300以下では登録できない' do
          @item.price = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it '販売価格は¥9,999,999以上では登録できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
    end
  end
end
