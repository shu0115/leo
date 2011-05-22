class UserSkillsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @skills = Skill.all( :order => "name ASC" )
  end

  #--------#
  # update #
  #--------#
  def update
    flash[:skill_notice] = ""

    params[:skill_list].each_pair{ |key, value|
      @user_skill = UserSkill.find_by_args( :user_id => session[:user_id], :skill_id => key )
      
      unless @user_skill.blank?
        # Update
        unless @user_skill.update_attributes( :level => value )
          flash[:skill_notice] += "#{Skill.get_name( :id => key )}レベルの保存に失敗しました。<br />"
        end
      else
        # Create
        @user_skill = UserSkill.new( :user_id => session[:user_id], :skill_id => key, :level => value )
        unless @user_skill.save
          flash[:skill_notice] += "#{Skill.get_name( :id => key )}レベルの保存に失敗しました。<br />"
        end
      end
    }

    if flash[:skill_notice].blank?
      flash[:skill_notice] += "スキルレベルを保存しました。<br />"
    end
    
    redirect_to :action => "index" and return
  end

end
