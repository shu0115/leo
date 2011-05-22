class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_skill

  private
  #-------------------#
  # self.find_by_args #
  #-------------------#
  def self.find_by_args( args )
    # 一致データが無い場合はnilが返る
    self.first( :conditions => args )
  end

  #---------------#
  # self.show_ok? #
  #---------------#
  def self.show_ok?( args, status_ok )
    # プロフィールがブランクであればfalseを返す
    return false if args[:profile].blank?

    # ユーザ自身のIDとプロフィールのユーザIDが一致したらtrueを返す
    return true if args[:user].id == args[:profile].user_id
    
    # ユーザ自身のステータスが承認済かプロフィールの公開設定がONであればtrueを返す
    return true if args[:profile].status == status_ok or args[:profile].public_mode == "ON"
    
    # 上記以外のケースはfalseを返す
    return false
  end
  
  #--------------------------#
  # self.status_approval_ok? #
  #--------------------------#
  def self.status_approval_ok?( user_id, status )
    user = User.find_by_args_and_include( { :id => user_id }, "profile" )
    
    if !user.profile.blank? and user.profile.status == status
      true
    else
      false
    end
  end

end
