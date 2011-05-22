class TopController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @lounge = Lounge.new
    @lounges = Lounge.all( :limit => $top_limit, :include => "user", :order => "created_at DESC" )
    @forums = Forum.all( :limit => $top_limit, :order => "latest_comment_at DESC" )
    @users = User.all( :limit => $top_limit, :order => "created_at DESC" )
  end
  
  #------#
  # post #
  #------#
  def post
    @lounge = Lounge.new( params[:lounge] )
    @lounge.user_id = session[:user_id]
    @lounge.save
    
    redirect_to :action => "index" and return
  end

end
