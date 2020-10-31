require 'rails_helper'

RSpec.describe BuyerInfo, type: :model do
  describe '購入情報の登録' do
    before do
      @buyer_info = FactoryBot.build(:buyer_info)
    end

    context '保存が成功する場合' do

      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@buyer_info).to be_valid
      end

      it 'buildingが空でも保存はできる' do
        @buyer_info.building = nil
        expect(@buyer_info). to be_valid
      end
    end
    
    context '保存が失敗する場合' do

      it 'post_codeが空だと保存できないこと' do
        @buyer_info.post_code = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがないと保存できないこと' do
        @buyer_info.post_code = '1234567'
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'region_idが"---"だと保存できないこと' do
        @buyer_info.region_id = 1
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include('Region must be other than 1')
      end

      it 'cityが空だと保存できないこと' do
        @buyer_info.city = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @buyer_info.address = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephoneが空だと保存できないこと' do
        @buyer_info.telephone = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'telephoneは11桁以内であること' do
        @buyer_info.telephone = '080123412345'
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include('Telephone is invalid')
      end

      it 'telephoneはハイフン不要であること' do
        @buyer_info.telephone = '080-1234-1234'
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include('Telephone is invalid')
      end
      
      it 'tokenが空では保存できないこと' do
        @buyer_info.token = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
