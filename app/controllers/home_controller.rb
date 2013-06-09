class HomeController < ApplicationController
  def index
    @rally = Rally.where(:is_current => true).first
  end

  def participants
    @rally = Rally.where(:is_current => true).first
    @participants = RallyParticipant.where(:rally_id => @rally.id).order('start_number ASC')
  end
end
