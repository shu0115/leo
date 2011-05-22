class Forum < ActiveRecord::Base
  
  private
  #-------------------#
  # self.find_by_args #
  #-------------------#
  def self.find_by_args( args )
    self.first( :conditions => args )
  end

  #-------------------------------#
  # self.update_latest_comment_at #
  #-------------------------------#
  def self.update_latest_comment_at( args )
    forum = self.first( :conditions => args )
    forum.latest_comment_at = Time.now
    forum.save
  end

  #---------------------------#
  # self.update_comment_count #
  #---------------------------#
  def self.update_comment_count( forum_id )
    comment_count = ForumComment.count( :conditions => { :forum_id => forum_id } )
    forum = Forum.first( :conditions => { :id => forum_id } )
    forum.comment_count = comment_count
    forum.save
  end

end
