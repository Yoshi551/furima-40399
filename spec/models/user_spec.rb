require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

    context '新規登録できないとき' do
    it 'ニックネームが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスに@が含まれていないと登録できない' do
    @user.email = 'testemail.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is not a valid email")
    end

  it 'パスワードが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
    end

  it 'パスワードが6文字未満では登録できない' do
    @user.password = '12345'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  it 'パスワードが半角英数字混合でないと登録できない' do
    @user.password = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
  end

  it 'パスワードとパスワード（確認）が一致していないと登録できない' do
    @user.password_confirmation = 'different'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it '姓が空では登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it '名が空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it '姓（カナ）が空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end

  it '名（カナ）が空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it '姓が全角文字でないと登録できない' do
    @user.last_name = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
  end

  it '名が全角文字でないと登録できない' do
    @user.first_name = 'rikutaro'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
  end

  it '姓（カナ）が全角カタカナでないと登録できない' do
    @user.last_name_kana = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
  end

  it '名（カナ）が全角カタカナでないと登録できない' do
    @user.first_name_kana = 'りくたろう'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
  end

  it '生年月日が空では登録できない' do
    @user.birth_date = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
  end
end
end
end