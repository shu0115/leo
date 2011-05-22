class UserSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  
  private
  #-------------------#
  # self.find_by_args #
  #-------------------#
  def self.find_by_args( args )
    self.first( :conditions => args )
  end

  #------------------#
  # self.all_by_args #
  #------------------#
  def self.all_by_args( args )
    self.all( :conditions => args )
  end

  #------------------------------------#
  # self.all_by_args_and_order_include #
  #------------------------------------#
  def self.all_by_args_and_order_include( args, order, for_include )
    self.all( :conditions => args, :order => order, :include => for_include )
  end

  #-----------------------------------------#
  # self.paginate_by_args_and_order_include #
  #-----------------------------------------#
  def self.paginate_by_args_and_order_include( args, page, perpage, order, for_include )
    self.paginate( :conditions => args, :page => page, :per_page => perpage, :order => order, :include => for_include )
  end

  #----------------#
  # self.get_level #
  #----------------#
  def self.get_level( args )
    user_skill = self.first( :conditions => args, :select => "level" )
    
    unless user_skill.blank?
      return user_skill.level
    else
      return 0
    end
  end

end
