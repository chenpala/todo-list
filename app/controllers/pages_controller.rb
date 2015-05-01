class PagesController < ApplicationController
  before_action :reject_signed_in_user

  def front
  end
end
