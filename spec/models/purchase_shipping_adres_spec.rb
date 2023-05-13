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
      it '番地が空でなければ保存できる' do
        @purchase_shipping_adres.block = '旭区１２３'
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
  end
end
