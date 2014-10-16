class CandidatesController < ApplicationController
  
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      Mailer.confirmation_email_candidate(@candidate).deliver
    end
    render
  end
  
  private
  
  def candidate_params
    params.require(:candidate).permit!
  end
end
