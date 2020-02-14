require 'rails_helper'



describe User do
  describe '#create' do
    it "nickname, email, password, password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthdayがあれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank")  
    end

    it "emailが空では登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
    end

    it "passwordが空では登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.blank")
    end

    it "family_nameが空では登録できない" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.family_name.blank")
    end

    it "first_nameが空では登録できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.first_name.blank")
    end

    it "family_name_kanaが空では登録できない" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("translation missing: ja.activerecord.errors.models.user.attributes.family_name_kana.blank")
    end

    it "first_name_kanaが空では登録できない" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("translation missing: ja.activerecord.errors.models.user.attributes.first_name_kana.blank")
    end

    it "birthdayが空では登録できない" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("translation missing: ja.activerecord.errors.models.user.attributes.birthday.blank")
    end

    it "passwordが７文字以上であれば登録できる " do
      user = build(:user, password: "11111aa", password_confirmation: "11111aa")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できない" do
      user = build(:user, password: "11111a", password_confirmation: "11111a")
      user.valid?
      expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")
    end

    it "重複したemailが存在する場合登録できない" do
      email = Faker::Internet.email
      user = create(:user, email: email)
      another_user = build(:user, email: email)
      # user2.valid?
      # user = create(:user)
      # another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.taken")
    end

    it "emailに@が存在しなければ登録できない" do
      user = build(:user, email: "kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
    end

    it "emailにドメインが存在しなければ登録できない" do
      user = build(:user, email: "kkkgmail")
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
    end

    it "family_nameが半角（カナ）の場合登録できない" do
      user = build(:user, family_name: "ｱｱｱ")
      user.valid?
      expect(user.errors[:family_name]).to include("全角のみで入力して下さい")
    end

    it "family_nameが半角（英字）の場合登録できない" do
      user = build(:user, family_name: "aaa")
      user.valid?
      expect(user.errors[:family_name]).to include("全角のみで入力して下さい")
    end

    it "irst_nameが半角(カナ）の場合登録できないこと" do
      user = build(:user, first_name: "ｱｱｱ")
      user.valid?
      expect(user.errors[:first_name]).to include("全角のみで入力して下さい")
    end

    it "irst_nameが半角（英字）の場合登録できないこと" do
      user = build(:user, first_name: "aaa")
      user.valid?
      expect(user.errors[:first_name]).to include("全角のみで入力して下さい")
    end

    it "family_name_kanaが半角の場合登録できない" do
      user = build(:user, family_name_kana: "ｱｱ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "first_name_kanaが半角の場合登録できない" do
      user = build(:user, family_name_kana: "ｱｱ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "family_name_kanaが全角カナでなければ登録できない（ひらがな）" do
      user = build(:user, family_name_kana: "あああ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "family_name_kanaが全角カナでなければ登録できない（英字）" do
      user = build(:user, family_name_kana: "ａａａ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "first_name_kanaが全角カナでなければ登録できない（ひらがな）" do
      user = build(:user, first_name_kana: "あああ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "first_name_kanaが全角カナでなければ登録できない（英字）" do
      user = build(:user, first_name_kana: "ａａａ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

  end
end