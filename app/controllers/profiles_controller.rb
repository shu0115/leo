class ProfilesController < ApplicationController

  #------#
  # show #
  #------#
  def show
    @user = User.find_by_args( :id => params[:user_id] )
    @profile = Profile.find_by_args( :user_id => params[:user_id] )
    @user_skills = UserSkill.all_by_args_and_order_include( { :user_id => params[:user_id] }, "skills.name", "skill" )

    if @profile.blank?
      if session[:user_id].to_s == params[:user_id].to_s
        redirect_to :action => "new" and return
      else
        redirect_to :root and return
      end
    end
  end

  #-----#
  # new #
  #-----#
  def new
    @profile = Profile.new
  end

  #--------#
  # create #
  #--------#
  def create
    @profile = Profile.new( params[:profile] )
    @profile.user_id = session[:user_id]

    if @profile.save
      redirect_to :action => "show", :user_id => @profile.user_id and return
    else
      render :action => "new" and return
    end
  end

  #------#
  # edit #
  #------#
  def edit
    @profile = Profile.find_by_args( :id => params[:id], :user_id => session[:user_id] )
  end

  #--------#
  # update #
  #--------#
  def update
    @profile = Profile.find_by_args( :id => params[:id], :user_id => session[:user_id] )

    if @profile.update_attributes( params[:profile] )
      redirect_to :action => "show", :user_id => @profile.user_id and return
    else
      render :action => "edit" and return
    end
  end

end
