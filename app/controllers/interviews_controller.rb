class InterviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews
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
    unless @interview.waiting?
      redirect_to user_interviews_path, notice: 'この面談の承認状態は既に決定されています'
    end
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

  def permit
    if Interview.find(params[:id]).day < Time.current
      redirect_to user_interviews_path, notice: '面談日時が過ぎているので許可できません'
    else
      User.find(params[:user_id]).interviews.each do |interview|
        interview.update_attribute(:permission, :denied)
      end
      Interview.find(params[:id]).admitted!
      InterviewMailer.decided_interview_to_user(current_user, Interview.find(params[:id])).deliver
      InterviewMailer.decided_interview_to_interviewer(current_user, Interview.find(params[:id])).deliver
      redirect_to user_interviews_path, notice: '面談を設定しました'
    end
  end

  private
    def interview_params
      params.require(:interview).permit(:day)
    end
end
