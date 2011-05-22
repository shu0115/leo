class Member

  #----------------------#
  # self.status_approval #
  #----------------------#
  def self.status_approval( args, status, user_id )
    profile = Profile.find_by_args( :user_id => args[:user_id] )
    profile.update_attributes( :status => status, :approval_user_id => user_id )
  end
  
end
