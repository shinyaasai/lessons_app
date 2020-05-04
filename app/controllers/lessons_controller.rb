class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "レッスンを作成しました"
      redirect_to lesson
    else
      flash[:alert] = "レッスンの作成に失敗しました"
      render new_lesson_path
    end
  end

  def show
    @lesson = Lesson.find_by(id: params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :practice_field, :target, :content, :user_id)
  end
end
