class HomeController < ApplicationController
  def index
    @rally = Rally.where(:is_current => true).first
  end
end
