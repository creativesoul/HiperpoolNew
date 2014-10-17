class Admin::HomesController < ApplicationController
  def index
    @candidates = Candidate.all
    @companies = Company.all
#    render :layout => false
  end
end