class MaintenancesController < ApplicationController
  def upload
    authorize :maintenance
  end
end
