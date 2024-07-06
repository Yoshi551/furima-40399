require "rails_helper"

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe "商品購入" do
    context "購入できるとき" do
      it "tokenがあれば保存ができること" do
        expect(@order_form).to be_valid
      end

      it "すべての情報が正しく入力されていれば購入できる" do
        expect(@order_form).to be_valid
      end

      it "建物名が空でも購入できる" do
        @order_form.building = ""
        expect(@order_form).to be_valid
      end
    end

    context "購入できないとき" do
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空では購入できない" do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it "郵便番号にハイフンがないと購入できない" do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it "都道府県が空では購入できない" do
        @order_form.prefecture_id = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "市区町村が空では購入できない" do
        @order_form.city = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空では購入できない" do
        @order_form.addresses = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
      end

      it "電話番号が空では購入できない" do
        @order_form.phone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号が9桁以下では購入できない" do
        @order_form.phone_number = "090123456"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が12桁以上では購入できない" do
        @order_form.phone_number = "090123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号にハイフンがあると購入できない" do
        @order_form.phone_number = "090-1234-5678"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できない" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
