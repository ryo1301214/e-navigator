class InterviewsController < ApplicationController
  def index
    @interviews = current_user.interviews
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

  private
    def interview_params
      params.require(:interview).permit(:day)
    end
end
