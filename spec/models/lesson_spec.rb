require 'rails_helper'

RSpec.describe Lesson, type: :model do

  before do
    @user = User.create(
      name: "次郎",
      email: "jiro@hoge.com",
      password: "hogehoge"
    )
  end

  it "タイトル、練習場所、教えたい、内容があれば有効であること" do
    lesson = @user.lessons.build(
      practice_field: "新城",
      title: "初心者歓迎",
      target: "初心者",
      content: "ゴルフを楽しもう!!",
    )
    expect(lesson).to be_valid
  end
  it "空のタイトルは登録出来ないこと" do
    lesson = @user.lessons.create(title: nil)
    expect(lesson.errors[:title]).to include("を入力してください")
  end

  it "空の練習場は登録出来ないこと" do
    lesson = @user.lessons.create(practice_field: nil)
    expect(lesson.errors[:practice_field]).to include("を入力してください")
  end

  it "空の教えたいは登録出来ないこと" do
    lesson = @user.lessons.create(target: nil)
    expect(lesson.errors[:target]).to include("を入力してください")
  end

  it "空の内容は登録出来ないこと" do
    lesson = @user.lessons.create(content: nil)
    expect(lesson.errors[:content]).to include("を入力してください")
  end

  it "練習場の入力は50文字未満であること"do
    lesson = @user.lessons.create(practice_field: "a" * 51 )
    expect(lesson.errors[:practice_field]).to include("は50文字以内で入力してください")
  end

  it "titleの入力は50文字未満であること"do
    lesson = @user.lessons.create(title: "a" * 31 )
    expect(lesson.errors[:title]).to include("は30文字以内で入力してください")
  end

  it "教えたいの入力は100文字未満であること"do
    lesson = @user.lessons.create(target: "a" * 101 )
    expect(lesson.errors[:target]).to include("は100文字以内で入力してください")
  end

  it "内容の入力は500文字未満であること"do
    lesson = @user.lessons.create(content: "a" * 501 )
    expect(lesson.errors[:content]).to include("は500文字以内で入力してください")
  end
end
