class OffencesController < ApplicationController
  skip_before_action :authenticate_user!, :authorize_user!

  def index
    respond_to do |format|
      format.json { render json: offences }
    end

    expires_in 60.minutes
  end

  private

  def offences
    MainOffence.all.map(&:as_json)
  end
end
