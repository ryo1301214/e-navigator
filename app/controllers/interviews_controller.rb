class InterviewsController < ApplicationController
  def index
    @interviews = User.find_by(id: params[:user_id]).interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = current_user.interviews.build(interview_params)
    if @interview.save
      redirect_to user_interviews_path, notice: '面談を登録しました'
    else
      render :new
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update(interview_params)
      redirect_to user_interviews_path, notice: '面談を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to user_interviews_path, notice: '面談を削除しました'
  end

  private
    def interview_params
      params.require(:interview).permit(:day)
    end
end
