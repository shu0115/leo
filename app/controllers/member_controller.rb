class MemberController < ApplicationController

  #------#
  # list #
  #------#
  def list
    @self_user = User.find_by_args( :id => session[:user_id] )
    @users = User.paginate( :include => :profile, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #----------#
  # approval #
  #----------#
  def approval
    # ユーザステータス更新
    Member.status_approval( params[:user], params[:commit], session[:user_id] )

    redirect_to :action => "list" and return
  end

end
