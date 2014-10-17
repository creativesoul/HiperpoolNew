class Mailer < ActionMailer::Base
  default from: "info@hiperpool.com"
  
  
  def confirmation_email_candidate(candidate)
    @candidate = candidate 
    mail(:to => @candidate.email, :subject => "Thank you for your interest in Hiperpool!")
  end
  
  def confirmation_email_company(company)
    @company = company 
    mail(:to => @company.email, :subject => "Thank you for your interest in Hiperpool!")
  end
end