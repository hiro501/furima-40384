require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  describe '配送先情報登録' do
    context '配送先情報が登録できる場合' do
      it 'すべての項目が存在すれば登録できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも登録できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '配送先情報が登録できない場合' do
      it 'postal_codeが空だと登録できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと登録できないこと' do
      end
      it 'cityが空だと登録できないこと' do
      end
      it 'street_addressが空だと登録できないこと' do
      end
      it 'phone_numberが空だと登録できないこと' do
      end
      it 'phone_numberが半角のハイフンを含んだ形式だと登録できないこと' do
      end
      it 'phone_numberが10桁以上でないと登録できないこと' do
      end
      it 'phone_numberが11桁以内でないと登録できないこと' do
      end
      it 'userが紐付いていないと登録できない' do
      end
    end
  end
end
