require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できるとき' do
      it '商品画像と商品名、商品の説明と商品の詳細、配送についてと販売価格が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'bear_idが空では出品できない' do
        @item.bear_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Bear can't be blank")
      end
      it 'area_idが空では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'number_of_day_idが空では出品できない' do
        @item.number_of_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of day can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英字では出品できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角カナでは出品できない' do
        @item.price = 'ｱｲｳ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが299以下だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'user_idに紐付いてないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
