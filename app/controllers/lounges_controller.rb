class LoungesController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @lounge = Lounge.new
#    @lounges = Lounge.all( :limit => 10, :include => "user", :order => "created_at DESC" )
    @lounges = Lounge.paginate( :include => "user", :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
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

  #---------#
  # destroy #
  #---------#
  def destroy
    @lounge = Lounge.find_by_args( :id => params[:id], :user_id => session[:user_id] )
    @lounge.destroy

    redirect_to :action => "index" and return
  end

end
