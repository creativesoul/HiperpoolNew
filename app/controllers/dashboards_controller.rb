class DashboardsController < ApplicationController
  
  def index
    @candidate = Candidate.new
    @company = Company.new
  end
end
