class ForumCommentsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @forum = Forum.find_by_args( :id => params[:forum_id] )
    @forum_comments = ForumComment.paginate( :include => "user", :conditions => { :forum_id => params[:forum_id] }, :page => params[:page], :per_page => $per_page, :order => "created_at ASC" )

    redirect_to :controller => "forums" and return if @forum.blank?
    
    @forum_user = User.find_by_args( :id => @forum.user_id )
  end

  #-----#
  # new #
  #-----#
  def new
    @forum_comment = ForumComment.new
  end

  #--------#
  # create #
  #--------#
  def create
    @forum_comment = ForumComment.new( params[:forum_comment] )
    @forum_comment.user_id = session[:user_id]

    if @forum_comment.save
      # 最終コメント時刻更新
      Forum.update_latest_comment_at( :id => @forum_comment.forum_id )
      
      # コメント数更新
      Forum.update_comment_count( @forum_comment.forum_id )

      redirect_to :action => "index", :forum_id => @forum_comment.forum_id and return
    else
      render :action => "new"
    end
  end

  #------#
  # edit #
  #------#
  def edit
    @forum_comment = ForumComment.find_by_args( :id => params[:id], :user_id => session[:user_id] )
    
    redirect_to :controller => "forums" and return if @forum_comment.blank?
  end

  #--------#
  # update #
  #--------#
  def update
    @forum_comment = ForumComment.find_by_args( :id => params[:id], :user_id => session[:user_id] )
    
    redirect_to :controller => "forums" and return if @forum_comment.blank?

    if @forum_comment.update_attributes( params[:forum_comment] )
      # 最終コメント時刻更新
      Forum.update_latest_comment_at( :id => @forum_comment.forum_id )
      redirect_to :action => "index", :forum_id => @forum_comment.forum_id and return
    else
      render :action => "edit" and return
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @forum_comment = ForumComment.find_by_args( :id => params[:id], :user_id => session[:user_id] )
    @forum_comment.destroy
      
    # コメント数更新
    Forum.update_comment_count( @forum_comment.forum_id )

    redirect_to :action => "index", :forum_id => @forum_comment.forum_id and return
  end
end
