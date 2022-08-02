require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品商品の登録' do
    context '出品商品の登録ができる場合' do
      it 'image、name、explanation、detail_category_id、detail_condition_id、delivery_charge_id、prefecture_id、delivery_date_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品商品の登録ができない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'Detail categoryが---では登録できない' do
        @item.detail_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end

      it 'Detail conditionが---では登録できない' do
        @item.detail_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail condition can't be blank")
      end

      it 'Delivery chargeが---では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it 'Prefectureが---では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'Delivery dateが---では登録できない' do
        @item.delivery_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end

      it 'Priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'Priceが299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it 'Priceが10000000以上では登録できない' do
        @item.price = '12345678'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end

      it 'Priceが半角英字では登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'Priceが全角英字では登録できない' do
        @item.price = 'ａｂｃ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'Priceが半角文字では登録できない' do
        @item.price = 'ｱｲｳ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'Priceがひらがなでは登録できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'Priceがカタカナでは登録できない' do
        @item.price = 'アイウ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'Priceが全角数字では登録できない' do
        @item.price = '１８００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
