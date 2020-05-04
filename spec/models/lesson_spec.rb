require 'rails_helper'

RSpec.describe Lesson, type: :model do

  it "タイトル、練習場所、教えたい、内容があれば有効であること" do
    lesson = build(:lesson)
    expect(lesson).to be_valid
  end
  it "空のタイトルは登録出来ないこと" do
    lesson = build(:lesson, title: nil)
    lesson.valid?
    expect(lesson.errors[:title]).to include("を入力してください")
  end

  it "空の練習場は登録出来ないこと" do
    lesson = build(:lesson, practice_field: nil)
    lesson.valid?
    expect(lesson.errors[:practice_field]).to include("を入力してください")
  end

  it "空の教えたいは登録出来ないこと" do
    lesson = build(:lesson, target: nil)
    lesson.valid?
    expect(lesson.errors[:target]).to include("を入力してください")
  end

  it "空の内容は登録出来ないこと" do
    lesson = build(:lesson, content: nil)
    lesson.valid?
    expect(lesson.errors[:content]).to include("を入力してください")
  end

  it "練習場の入力は50文字未満であること"do
    lesson = build(:lesson, practice_field: "a" * 51 )
    lesson.valid?
    expect(lesson.errors[:practice_field]).to include("は50文字以内で入力してください")
  end

  it "titleの入力は50文字未満であること"do
    lesson = build(:lesson, title: "a" * 31 )
    lesson.valid?
    expect(lesson.errors[:title]).to include("は30文字以内で入力してください")
  end

  it "教えたいの入力は100文字未満であること"do
    lesson = build(:lesson, target: "a" * 101 )
    lesson.valid?
    expect(lesson.errors[:target]).to include("は100文字以内で入力してください")
  end

  it "内容の入力は500文字未満であること"do
    lesson = build(:lesson, content: "a" * 501 )
    lesson.valid?
    expect(lesson.errors[:content]).to include("は500文字以内で入力してください")
  end
end
