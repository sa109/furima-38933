require 'rails_helper'

RSpec.describe PurchaseShippingAdres, type: :model do
  before do
    @purchase_shipping_adres = FactoryBot.build(:purchase_shipping_adres)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき' do
      it '全ての情報が正しく入力されていれば保存ができる' do
        expect(@purchase_shipping_adres).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @purchase_shipping_adres.user_id = 1
        expect(@purchase_shipping_adres).to be_valid
      end
      it 'item_idが空でなければ保存ができる' do
        @purchase_shipping_adres.item_id = 2
        expect(@purchase_shipping_adres).to be_valid
      end
      it '郵便番号が「３桁＋ハイフン＋４桁」の組み合わせであれば保存ができる' do
        @purchase_shipping_adres.post_code = '123-1234'
        expect(@purchase_shipping_adres).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存ができる' do
        @purchase_shipping_adres.region_id = '2'
        expect(@purchase_shipping_adres).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @purchase_shipping_adres.city = '市原市'
        expect(@purchase_shipping_adres).to be_valid
      end
      it '番地が空でなければ保存ができる' do
        @purchase_shipping_adres.block = '市原123'
        expect(@purchase_shipping_adres).to be_valid
      end
      it '建物名が空でも保存ができる' do
        @purchase_shipping_adres.building = nil
        expect(@purchase_shipping_adres).to be_valid
      end
      it '電話番号が11桁以内かつハイフンなしであれば保存できる' do
        @purchase_shipping_adres.phone_number = 12_345_678_910
        expect(@purchase_shipping_adres).to be_valid
      end
    end

    context '配送先情報が保存できないとき' do
      it 'user_idが空だと保存できない' do
        @purchase_shipping_adres.user_id = nil
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchase_shipping_adres.item_id = nil
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @purchase_shipping_adres.post_code = nil
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号がハイフンがなければ保存ができない' do
        @purchase_shipping_adres.post_code = '1_234_123'
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が「---」だと登録されない' do
        @purchase_shipping_adres.region_id = 1
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @purchase_shipping_adres.city = nil
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @purchase_shipping_adres.block = nil
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できない' do 
        @purchase_shipping_adres.phone_number = nil
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号がハイフンがあると保存できない' do
        @purchase_shipping_adres.phone_number = '123-1234-1212'
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号が９桁以下だと保存できない' do
        @purchase_shipping_adres.phone_number = '12345678'
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が12桁以上だと保存できない' do
        @purchase_shipping_adres.phone_number = '12_3456_789_012'
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Phone number is too short", "Phone number is invalid. Input only number")
      end
      it '電話番号が全角だと保存できない' do
        @purchase_shipping_adres.phone_number = '１２＿２３４＿５６７＿８８８'
        @purchase_shipping_adres.valid?
        expect(@purchase_shipping_adres.errors.full_messages).to include("Phone number is too short", "Phone number is invalid. Input only number")
      end
    end
  end
end
