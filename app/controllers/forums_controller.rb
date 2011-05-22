class ForumsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @forums = Forum.paginate( :page => params[:page], :per_page => $per_page, :order => "latest_comment_at DESC" )
  end

  #-----#
  # new #
  #-----#
  def new
    @forum = Forum.new
  end

  #--------#
  # create #
  #--------#
  def create
    @forum = Forum.new( params[:forum] )
    @forum.user_id = session[:user_id]

    if @forum.save
      redirect_to :action => "index" and return
    else
      render :action => "new" and return
    end
  end

  #------#
  # show #
  #------#
  def show
    @forum = Forum.find_by_args( :id => params[:id] )
  end

  #------#
  # edit #
  #------#
  def edit
    @forum = Forum.find_by_args( :id => params[:id], :user_id => session[:user_id] )
    
    redirect_to :action => "index" and return if @forum.blank?
  end

  #--------#
  # update #
  #--------#
  def update
    @forum = Forum.find_by_args( :id => params[:id], :user_id => session[:user_id] )

    if @forum.update_attributes( params[:forum] )
      redirect_to :action => "index" and return
    else
      render :action => "edit" and return
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @forum = Forum.find_by_args( :id => params[:id], :user_id => session[:user_id] )
    @forum.destroy

    redirect_to :action => "index" and return
  end
end
