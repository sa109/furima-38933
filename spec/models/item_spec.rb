require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '正常に登録ができる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが[---]以外であれば登録できる' do
        @item.category_id = 1
        except(@item).to be_valid
      end
      it '商品の状態が[---]以外であれば登録できる' do
        @item.status_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が[---]以外であれば登録できる' do
        @item.postage_id = 1
        expect(:item).to be_valid
      end
      it '配送元の地域が[---]以外であれば登録できる' do
        @item.postage_id = 1
        expect(:item).to be_valid
      end
      it '発送までの日数が[---]以外であれば登録できる' do
        @item.shipping_day_id = 1
        expect(:item).to be_valid
      end
      it '価格が半角数字かつ300円~9,999,999円であれば登録できる' do
        @item.price = 300
        expect(:item).to be_valid
      end
    end

    context '出品登録ができないとき' do
      it 'ユーザー登録している人でないと登録ができない' do
        @item.user_id = nill
        @item.valid?
        except(@item.errors.full_messages).to include("User must exist", "User can't be blank")
      end

      it 'nameが空だと登録ができない' do






    end
  end


end
