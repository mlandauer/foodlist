class UploadsController < ApplicationController
  # TODO This should only be accessible by admin users
  before_action :authenticate_user!

  def new
  end
end
