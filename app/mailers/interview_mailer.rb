class InterviewMailer < ApplicationMailer
  def request_interviewer(interviewer, user)
    @interviewer = interviewer
    @user = user
    mail to: interviewer.email, subject: '面接希望日が決まりました'
  end

  def decided_interview_to_user(interviewer, interview)
    @interviewer = interviewer
    @interview = interview
    mail to: interview.user.email, subject: '面接日時が確定しました'
  end

  def decided_interview_to_interviewer(interviewer, interview)
    @interviewer = interviewer
    @interview = interview
    mail to: interviewer.email, subject: '面接日時が確定しました'
  end
end
