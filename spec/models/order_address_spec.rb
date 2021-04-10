require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  context '商品が購入できる時' do
    it 'post_num、shipment_source_id、city、address, phone_num,token,user_id,item_idが存在すれば登録できること' do
      expect(@order_address).to be_valid
    end

    it 'build_nameが空でも登録できること' do
      @order_address.build_name = nil
      expect(@order_address).to be_valid
    end
  end

  context '商品が購入できない時' do
    it 'post_numがない場合は登録できないこと' do
      @order_address.post_num = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post num can't be blank")
    end

    it 'post_numにハイフンがない場合は登録できないこと' do
      @order_address.post_num = 1_234_567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post num is invalid. Include hyphen(-)')
    end

    it 'shipment_source_idがない場合は登録できないこと' do
      @order_address.shipment_source_id = 0
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

    it 'phone_numが11桁より多いと登録できないこと' do
      @order_address.phone_num = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone num input only number')
    end

    it 'phone_numが英数混合では登録できないこと' do
      @order_address.phone_num = '0901w3t5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone num input only number')
    end

    it 'tokenがない場合は登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idがないと登録できないこと' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idがないと登録できないこと' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
