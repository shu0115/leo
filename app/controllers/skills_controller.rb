class SkillsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @skills = Skill.paginate( :page => params[:page], :per_page => $per_page, :order => "name ASC" )
  end

  #--------#
  # create #
  #--------#
  def create
    @skill = Skill.new( params[:skill] )
    @skill.user_id = session[:user_id]

    unless @skill.save
      flash[:notice] = "スキルの作成に失敗しました。<br /><br />"
    end

    redirect_to :action => "index"
  end

  #------#
  # edit #
  #------#
  def edit
    @skill = Skill.find_by_args( :id => params[:id] )
  end

  #--------#
  # update #
  #--------#
  def update
    @skill = Skill.find_by_args( :id => params[:id] )

    if @skill.update_attributes( params[:skill] )
      redirect_to :action => "index" and return
    else
      print "[ @skill.errors ] : "; p @skill.errors ;
#      flash[:notice] = "スキルの更新に失敗しました。<br /><br />"
      render :action => "edit" and return
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @skill = Skill.find_by_args( :id => params[:id], :user_id => session[:user_id] )
    
    redirect_to :action => "index" and return if @skill.blank?
    
    unless @skill.destroy
      flash[:notice] = "スキルの削除に失敗しました。<br /><br />"
    end

    redirect_to :action => "index" and return
  end

end
