class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      flash[:nitice] = 'プロフィールを登録しました'
      redirect_to @profile
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = 'プロフィールを編集しました'
      redirect_to @profile
    else
      render :edit
    end
  end

  private
    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:name, :birthday, :sex, :school)
    end
end
