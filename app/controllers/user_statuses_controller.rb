class UserStatusesController < ApplicationController
  # GET /user_statuses
  # GET /user_statuses.xml
  def index
    @user_statuses = UserStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_statuses }
    end
  end

  # GET /user_statuses/1
  # GET /user_statuses/1.xml
  def show
    @user_status = UserStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_status }
    end
  end

  # GET /user_statuses/new
  # GET /user_statuses/new.xml
  def new
    @user_status = UserStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_status }
    end
  end

  # GET /user_statuses/1/edit
  def edit
    @user_status = UserStatus.find(params[:id])
  end

  # POST /user_statuses
  # POST /user_statuses.xml
  def create
    @user_status = UserStatus.new(params[:user_status])

    respond_to do |format|
      if @user_status.save
        format.html { redirect_to(@user_status, :notice => 'UserStatus was successfully created.') }
        format.xml  { render :xml => @user_status, :status => :created, :location => @user_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_statuses/1
  # PUT /user_statuses/1.xml
  def update
    @user_status = UserStatus.find(params[:id])

    respond_to do |format|
      if @user_status.update_attributes(params[:user_status])
        format.html { redirect_to(@user_status, :notice => 'UserStatus was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_statuses/1
  # DELETE /user_statuses/1.xml
  def destroy
    @user_status = UserStatus.find(params[:id])
    @user_status.destroy

    respond_to do |format|
      format.html { redirect_to(user_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
