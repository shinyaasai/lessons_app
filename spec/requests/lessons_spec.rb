require 'rails_helper'

RSpec.describe "Lessons", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, name: "タケシ") }
  let(:lesson) { create(:lesson) }

  describe "GET /lessons" do
    before do
      get lessons_path
    end

    it "正常にレスポンスが返ってくること" do
      expect(response).to have_http_status(200)
    end

    it "レッスン一覧に正しく表示されること" do
      user.lessons.each do |lesson|
        expect(response.body).to have_content lesson.title
        expect(respons.body).to have_content lesson.practice_field
        expect(response.body).to have_content user.name
      end
    end

    it "投稿したユーザーとレッスンが一致すること" do
      user.lessons.each do |lesson|
        expect(response.body).to have_content user.name
        expect(response.body).not_to have_content other_user.name
      end
    end

    describe "get /lesson/id" do
      before do
        get lesson_path(lesson.id)
      end

      it "正常にレスポンスが返ってくること" do
        expect(response).to have_http_status(200)
      end

      it "lesson_titleが表示されること" do
        expect(response.body).to include lesson.title
      end

      it "lesson_practice_fieldが表示されること" do
        expect(response.body).to include lesson.practice_field
      end

      it "lesson_targetが表示されること" do
        expect(response.body).to include lesson.target
      end

      it "lesson_contentが表示されること" do
        expect(response.body).to include lesson.content
      end
    end
  end
end
