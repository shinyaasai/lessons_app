require 'rails_helper'

RSpec.feature "Lessons", type: :feature do
  scenario "ユーザーは新しいレッスンを作成する" do
    user = create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "サインインする"
    expect do
      expect(current_path).to eq lessons_path
      click_link "レッスンを作成"
      fill_in "lesson_title", with: "初心者OK"
      fill_in "lesson_practice_field", with: "八名ゴルフ"
      fill_in "lesson_target", with: "初めての人"
      fill_in "lesson_content", with: "握りから教えます!"
      click_button "登録"

      expect(page).to have_content "初心者OK"
      expect(page).to have_content "八名ゴルフ"
      expect(page).to have_content "初めての人"
      expect(page).to have_content "握りから教えます!"
    end.to change(user.lessons, :count).by(1)
  end

  scenario "表示中のレッスンをクリックすると詳細ページへ飛ぶ" do
    lesson = create(:lesson)
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: lesson.user.email
    fill_in "パスワード", with: lesson.user.password
    click_button "サインインする"
    click_on lesson.title
    expect(current_path).to eq lesson_path(lesson.id)
  end

  scenario "レッスンを作成をクリックすると作成ページへ飛ぶ" do
    lesson = create(:lesson)
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: lesson.user.email
    fill_in "パスワード", with: lesson.user.password
    click_button "サインインする"
    click_on "レッスンを作成"
    expect(current_path).to eq new_lesson_path
  end
end
