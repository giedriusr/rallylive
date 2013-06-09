class HomeController < ApplicationController
  def index
    @rally = Rally.where(:is_current => true).first
  end

  def participants
    @rally = Rally.where(:is_current => true).first
    @participants = RallyParticipant.where(:rally_id => @rally.id)
  end

  def start_order
    @rally = Rally.where(:is_current => true).first
    @participants = RallyParticipant.where(:rally_id => @rally.id).order('start_number ASC')
  end

  def special_stages
  end
end
