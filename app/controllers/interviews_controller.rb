class InterviewsController < ApplicationController
  def index
    @interviews = current_user.interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.user_id = current_user.id
    if @interview.save
      redirect_to :new
    else
      render :new
    end
  end

  private
    def interview_params
      params.require(interview).permit(:day, :admission)
    end
end
