class AccountController < ApplicationController
  def list
    @accounts = BillingService.clients_with_accounts
  end

  def clients
    @clients = BillingService.clients_without_accounts
  end

  def details
    @patient_obj = BillingService.get_patient(params[:patient_id])
    @account = Account.where(patient_id: params[:patient_id]).first rescue nil
  end

  def new
    @patient_obj = BillingService.get_patient(params[:patient_id])
    @account = Account.where(patient_id: params[:patient_id]).first rescue nil
  end

  def create
    Account.create(patient_id: params[:patient_id], 
    account_number: params[:account_number], effective_date: Date.today)    
    redirect_to '/accounts'
  end

  def fetch_account_number
    number = Account.maximum(:account_number) || 0
    render text: (number + 1).to_s.ljust(10,'0').to_i.to_json and return
  end

end
