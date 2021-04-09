require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  context '商品が購入できる時' do
    it 'post_num、shipment_source_id、city、address, phone_num,tokenが存在すれば登録できること' do
      expect(@order_address).to be_valid
    end

    context '商品が購入できない時' do
      it 'post_numがない場合は登録できないこと' do
        @order_address.post_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num can't be blank")
      end

      it 'shipment_source_idがない場合は登録できないこと' do
        @order_address.shipment_source_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipment source can't be blank")
      end

      it 'cityがない場合は登録できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressがない場合は登録できないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numがない場合は登録できないこと' do
        @order_address.phone_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numが数字以外では登録できないこと' do
        @order_address.phone_num = 'abc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone num input only number')
      end

      it 'tokenがない場合は登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
