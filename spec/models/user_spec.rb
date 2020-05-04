require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なファクトリを持つこと" do
    expect(build(:user)).to be_valid
  end

  it "ユーザーネームが空であれば無効な状態であること" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "メールが空であれば無効な状態であること" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "パスワードが空であれば無効な状態であること" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "重複したユーザーネームは無効な状態であること" do
    FactoryBot.create(:user, name: "ボブ")
    user = build(:user, name: "ボブ")
    user.valid?
    expect(user.errors[:name]).to include("はすでに存在します")
  end

  it "重複したメールは無効な状態であること" do
    FactoryBot.create(:user, email: "testuser@hoge.com")
    user = User.new(email: "testuser@hoge.com",)
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "6文字未満のパスワードは無効であること" do
    user = build(:user, password: "abcde")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end
end
