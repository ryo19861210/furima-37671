require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  context '内容に問題がない場合' do
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@order_address).to be_valid
    end
    it 'build_nameは空でも登録できる' do
      @order_address.build_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では登録できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank",
                                                             'Post code is invalid. Include hyphen(-)')
    end
    it '郵便番号は半角文字以外では登録できない' do
      @order_address.post_code = '１２３-４５６７'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it '郵便番号はハイフンなしでは登録できない' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it '都道府県が空では登録できない' do
      @order_address.place_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Place must be other than 1')
    end
    it '市区町村が未選択では登録できない' do
      @order_address.town = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Town can't be blank")
    end
    it '番地が空では登録できない' do
      @order_address.number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Number can't be blank")
    end
    it '電話番号が空では登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end
    it '電話番号は10桁以上11桁以内でないと登録できない' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は半角数値以外では登録できない' do
      @order_address.phone_number = '０８０６０９８２２３５'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号はハイフンがあると登録できない' do
      @order_address.phone_number = '080-6098-2235'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
