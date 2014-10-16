class CompaniesController < ApplicationController
  
  def create
    @company = Company.new(company_params)
    if @company.save
       Mailer.confirmation_email_company(@company).deliver
    end
    render
  end
  
  private
  def company_params
    params.require(:company).permit!
  end
end
