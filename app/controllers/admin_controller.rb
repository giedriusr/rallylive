class AdminController < ApplicationController
  before_action :check_if_admin!

  private
    def check_if_admin!
      redirect_to root_path unless user_signed_in?
    end
end