class RankingController < ApplicationController

  #------------#
  # guild_rank #
  #------------#
  def guild_rank
    @self_user = User.find_by_args( :id => session[:user_id] )
    @users = User.paginate( :page => params[:page], :per_page => $per_page, :order => "rank DESC, id ASC" )
  end

  #-------------#
  # skill_level #
  #-------------#
  def skill_level
    @self_user = User.find_by_args( :id => session[:user_id] )
    @skills = Skill.all( :order => "name ASC" )
    @user_skills = UserSkill.paginate_by_args_and_order_include( { :skill_id => params[:skill_id] }, params[:page], $per_page, "level DESC, user_id ASC", "user" )
  end

end
