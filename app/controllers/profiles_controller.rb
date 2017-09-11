class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path, notice: 'Profile Saved'
    else
      render :new, alert: 'Please Enter Valid Values'
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: 'Profile Updated'
    else
      render :new, alert: 'Please Enter Valid Values'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :company)
  end

  def find_profile
    @profile = Profile.find_by(id: params[:id])
  end
end
