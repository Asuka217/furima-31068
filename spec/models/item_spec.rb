require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it 'すべての項目がきちんと入力されている場合は登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'ユーザーがログイン状態でないと、出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品の画像が選択されていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が入力されていない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が入力されていない' do
        @item.explication = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explication can't be blank")
      end

      it 'カテゴリー情報が選択されていない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態が選択されていない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end

      it '配送料の選択がされていない' do
        @item.fee_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee shipping must be other than 1')
      end

      it '発送元の選択がされていない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end

      it '発送日数の選択がされていない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end

      it '価格の入力がされていない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '入力した価格が、300〜9,999,999の間となっていない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it '入力した金額が半角数字になっていない' do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
