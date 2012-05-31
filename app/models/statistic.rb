class Statistic
  include ActiveModel::AttributeMethods
  include ActiveModel::MassAssignmentSecurity
  
	attr_accessor :player
	attr_accessor :player_statistics
	attr_accessible :player, :player_statistics
	
	def initialize(attributes={})
    unless attributes.empty?
      @player=attributes[:player] if attributes.has_key?(:player)
      @player_statistics=attributes[:player_statistics] if attributes.has_key?(:player_statistics)
	  end
	end
end