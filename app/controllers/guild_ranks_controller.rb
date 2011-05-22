class GuildRanksController < ApplicationController

  #------#
  # show #
  #------#
  def show
    # 対象ユーザ
    @user = User.find_by_args( :id => params[:user_id] )
    
    redirect_to :root and return if @user.blank?
    
    # ログインユーザギルドランク承認
    @guild_rank = GuildRank.find_by_args( :user_id => session[:user_id], :target_user_id => params[:user_id], :rank => @user.rank )
    @guild_rank = GuildRank.new if @guild_rank.blank?

    # 現状承認リスト
    @guild_ranks_keep = GuildRank.all_by_args_and_order_include( { :target_user_id => params[:user_id], :approval => t("guild_rank.keep"), :rank => @user.rank }, "updated_at ASC", "user" )

    # 上方要求リスト
    @guild_ranks_up = GuildRank.all_by_args_and_order_include( { :target_user_id => params[:user_id], :approval => t("guild_rank.up"), :rank => @user.rank }, "updated_at ASC", "user" )

    # 下方要求リスト
    @guild_ranks_down = GuildRank.all_by_args_and_order_include( { :target_user_id => params[:user_id], :approval => t("guild_rank.down"), :rank => @user.rank }, "updated_at ASC", "user" )

    # ユーザスキルリスト
    @user_skills = UserSkill.all_by_args_and_order_include( { :user_id => params[:user_id] }, "skills.name", "skill" )
  end

  #--------#
  # update #
  #--------#
  def update
    GuildRank.update_guild_rank( :approval => params[:commit], :guild_rank => params[:guild_rank] )
    
    redirect_to :action => "show", :user_id => params[:target_user_id] and return
  end

  #--------------------#
  # skill_level_update #
  #--------------------#
  def skill_level_update
    SkillLevel.update_skill_level( :approval => params[:commit], :skill_level => params[:skill_level] )
    
    redirect_to :action => "show", :user_id => params[:target_user_id] and return
  end

end
