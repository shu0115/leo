class Skill < ActiveRecord::Base
  has_one :user_skill
  has_one :skill_level

  private
  #-------------------#
  # self.find_by_args #
  #-------------------#
  def self.find_by_args( args )
    self.first( :conditions => args )
  end

  #------------------------------------#
  # self.all_by_args_and_order_include #
  #------------------------------------#
  def self.all_by_args_and_order_include( args, order, for_include )
    self.all( :conditions => args, :order => order, :include => for_include )
  end

end
