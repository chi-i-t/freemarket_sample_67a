require 'rails_helper'
describe User do
  describe '#create' do
    # 1.nickname, email, password, password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthdayがあれば登録できること
    it "is valid with a nickname, email, password, password_confirmation,nickname,family_name,first_name,family_name_kana,first_name_kana,birthday" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2.nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank")  
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
    end

    # 4.passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
    end

    # 5.passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.blank")
    end

    # 6.family_nameが空では登録できないこと
    it "is invalid without a family_name" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.family_name.blank")
    end

    # 7.first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.first_name.blank")
    end

    # 8.family_name_kanaが空では登録できないこと
    it "is invalid without a family_name_kana" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("translation missing: ja.activerecord.errors.models.user.attributes.family_name_kana.blank")
    end

    # 9.first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("translation missing: ja.activerecord.errors.models.user.attributes.first_name_kana.blank")
    end

    # 10.birthdayが空では登録できないこと
    it "is invalid without a birthday" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("translation missing: ja.activerecord.errors.models.user.attributes.birthday.blank")
    end

    # 11.passwordが７文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "11111aa", password_confirmation: "11111aa")
      user.valid?
      expect(user).to be_valid
    end

    # 12. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "11111a", password_confirmation: "11111a")
      user.valid?
      expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")
    end

    # 13. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.taken")
    end

    # 14. emailに@がなければ登録できないこと
    it "emailに@なし" do
      user = build(:user, email: "kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
    end

    # 15. emailにドメインがなければ登録できないこと
    it "emailにドメインなし" do
      user = build(:user, email: "kkkgmail")
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
    end

   # 16. family_nameが半角であれば登録できないこと
    it "family_nameが半角" do
      user = build(:user, family_name: "ｱa")
      user.valid?
      expect(user.errors[:family_name]).to include("全角のみで入力して下さい")
    end

    # 17. first_nameが半角であれば登録できないこと
    it "first_nameが半角" do
      user = build(:user, first_name: "ｱa")
      user.valid?
      expect(user.errors[:first_name]).to include("全角のみで入力して下さい")
    end

    # 18. family_name_kanaが半角であれば登録できないこと
    it "family_name_kanaが半角" do
      user = build(:user, family_name_kana: "ｱｱ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    # 19. first_name_kanaが半角であれば登録できないこと
    it "family_name_kanaが半角" do
      user = build(:user, family_name_kana: "ｱｱ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    # 20. family_name_kanaが全角カナでなければ登録できないこと
    it "family_name_kanaが全角カナ以外" do
      user = build(:user, family_name_kana: "ああａａ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    # 21. first_name_kanaが全角カナでなければ登録できないこと
    it "first_name_kanaが全角カナ以外" do
      user = build(:user, first_name_kana: "ああａａ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

  end
end