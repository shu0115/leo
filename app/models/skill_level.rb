class SkillLevel < ActiveRecord::Base
  belongs_to :user

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

  #-------------------------#
  # self.update_skill_level #
  #-------------------------#
  def self.update_skill_level( args )
    @skill_level = self.find_by_args( :user_id => args[:skill_level][:user_id], :target_user_id => args[:skill_level][:target_user_id], :skill_id => args[:skill_level][:skill_id], :level => args[:skill_level][:level] )

    unless @skill_level.blank?
      # Update
      @skill_level.update_attributes( :approval => args[:approval], :level => args[:skill_level][:level] )
    else
      # Create
      @skill_level = self.new( :user_id => args[:skill_level][:user_id], :target_user_id => args[:skill_level][:target_user_id], :skill_id => args[:skill_level][:skill_id], :approval => args[:approval], :level => args[:skill_level][:level] )
      @skill_level.save
    end
  end

end
