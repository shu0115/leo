class GuildRank < ActiveRecord::Base
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

  #------------------------#
  # self.update_guild_rank #
  #------------------------#
  def self.update_guild_rank( args )
    @guild_rank = self.find_by_args( :user_id => args[:guild_rank][:user_id], :target_user_id => args[:guild_rank][:target_user_id], :rank => args[:guild_rank][:rank] )

    unless @guild_rank.blank?
      # Update
      @guild_rank.update_attributes( :approval => args[:approval], :rank => args[:guild_rank][:rank] )
    else
      # Create
      @guild_rank = self.new( :user_id => args[:guild_rank][:user_id], :target_user_id => args[:guild_rank][:target_user_id], :approval => args[:approval], :rank => args[:guild_rank][:rank] )
      @guild_rank.save
    end
  end

end
