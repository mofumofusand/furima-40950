require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'tokenとpost_code、area_idとmunicipalities、blockとbuilding_name、phone_number(11桁)が存在し、item_idとuser_idに紐付いていれば購入できる' do
        expect(@buy_address).to be_valid
      end
      it 'phone_numberが10桁でも購入できる' do
        @buy_address.phone_number  = '0000000000'
        expect(@buy_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'トークンの情報が空では購入できない' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @buy_address.post_code = 1234567
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'area_idが空では購入できない' do
        @buy_address.area_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @buy_address.municipalities = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'blockが空では購入できない' do
        @buy_address.block = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @buy_address.phone_number = '000000000'

        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @buy_address.phone_number = '000000000000'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角では購入できない' do
        @buy_address.phone_number = '００００００００００'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに(-)があれば購入できない' do
        @buy_address.phone_number = '000-0000-0000'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'item_idに紐付いてないと購入できない' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idに紐付いてないと購入できない' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
