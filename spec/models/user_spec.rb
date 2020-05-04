require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザーネーム, メール,パスワードがあれば有効な状態であること" do
    user = User.new(
      name: "太郎",
      email: "testuser@hoge.com",
      password: "hogehoge"
    )
    expect(user).to be_valid
  end

  it "ユーザーネームが空であれば無効な状態であること" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "メールが空であれば無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "パスワードが空であれば無効な状態であること" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "重複したユーザーネームは無効な状態であること" do
    User.create(
      name: "ボブ",
      email: "testuser@hogehoge.com",
      password: "hogehoge"
    )
    user = User.new(name: "ボブ")
    user.valid?
    expect(user.errors[:name]).to include("はすでに存在します")
  end

  it "重複したメールは無効な状態であること" do
    User.create(
      name: "太郎",
      email: "testuser@hoge.com",
      password: "hogehoge"
    )
    user = User.new(email: "testuser@hoge.com",)
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "6文字未満のパスワードは無効であること" do
    user = User.new(password: "abcde")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end
end
