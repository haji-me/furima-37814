require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品の購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end

    context '商品の購入ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'postcodeが空だと保存できないこと' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeが全角文字列だと保存できないこと' do
        @order_address.postcode = '８８８－８８８８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it 'postcodeが数字以外だと保存できないこと' do
        @order_address.postcode = 'aaa-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it 'postcodeが3桁と4桁の数字の間にハイフンがないと保存できないこと' do
        @order_address.postcode = '1112222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it 'postcodeが3桁と4桁の数字の間に半角のハイフンがないと保存できないこと' do
        @order_address.postcode = '111－1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが---では保存できないこと' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空だと保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'street number が空だと保存できないこと' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end

      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが全角数字だと保存できないこと' do
        @order_address.phone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneハイフンが含まれると保存できないこと' do
        @order_address.phone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneが9桁以下だと保存できないこと' do
        @order_address.phone = '03123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneが12桁以上だと保存できないこと' do
        @order_address.phone = '090123456781234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
