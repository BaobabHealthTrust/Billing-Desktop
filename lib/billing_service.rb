module BillingService

  def self.update_details(params)
    account = BillingAccount.where(patient_id: params[:patient_id]).first
    if account.blank?
      BillingAccount.create(patient_id: params[:patient_id],
        account_number: params[:member_id], insurance_plan_id: params[:plan],
        relationship: params[:relationship], effective_date: params[:effective_date].to_date,
        cover_period_start_date: params[:coverage_period]['start'].to_date,
        cover_period_end_date: params[:coverage_period]['end'].to_date)

        PatientService.create_visit(params[:patient_id])
    else
      account.update_attributes(patient_id: params[:patient_id],
        account_number: params[:member_id], insurance_plan_id: params[:plan],
        relationship: params[:relationship], effective_date: params[:effective_date].to_date,
        cover_period_start_date: params[:coverage_period]['start'].to_date,
        cover_period_end_date: params[:coverage_period]['end'].to_date)
    end
  end

  def self.client_live_search(search_params)
    identifier = search_params
    given_name = search_params.split(" ")[0]
    family_name = search_params.split(" ")[1] ||= ""

    person_ids = PersonName.joins("INNER JOIN person_name_code c 
      USING(person_name_id)").where("given_name_code LIKE ('#{given_name.soundex}%%')
      AND family_name_code LIKE ('#{family_name.soundex}%%')").map(&:person_id) unless search_params.blank?

    if search_params.blank?
      person_ids = BillingAccount.all.limit(100).map(&:patient_id)
    end

    person_ids = [0] if person_ids.blank?

    patients = Patient.where("patient.patient_id IN(?)", 
      person_ids).limit(100).joins("INNER JOIN billing_accounts b USING(patient_id)").order("patient.date_created")
    results = []

    (patients || []).each do |patient|
      names = patient.person.person_names.last rescue []
      first_name = names.given_name.decrypt rescue ""
      last_name = names.family_name.decrypt rescue ""

      account = Account.where(patient_id: patient.patient_id).first

      patient_obj = PatientBean.new('')
      patient_obj.given_name = first_name
      patient_obj.family_name = last_name 
      patient_obj.birthdate = patient.person.birthdate.strftime('%d-%b-%Y')
      patient_obj.age = patient.person.age
      patient_obj.gender = patient.person.gender
      patient_obj.patient_id = patient.id
      patient_obj.account_number = account.account_number
      patient_obj.account_type = account.account_type.name
      patient_obj.account_relationship = account.relationship
      patient_obj.effective_date = account.effective_date.strftime('%d-%b-%Y')
      patient_obj.cover_period_start_date = account.cover_period_start_date.strftime('%d-%b-%Y')
      patient_obj.cover_period_end_date = account.cover_period_end_date.strftime('%d-%b-%Y')

      results << patient_obj 
    end

    return results
  end

  def self.clients_without_accounts
    patients = Patient.limit(10)
    results = []

    (patients || []).each do |patient|
      names = patient.person.names.last rescue []
      first_name = names.given_name
      last_name = names.family_name
=begin
      #account = BillingAccount.where(patient_id: patient.patient_id).first
=end
      patient_obj = PatientBean.new('')
      patient_obj.given_name = first_name
      patient_obj.family_name = last_name 
      patient_obj.birthdate = patient.person.birthdate.strftime('%d-%b-%Y')
      patient_obj.age = patient.person.age
      patient_obj.gender = patient.person.gender
      patient_obj.patient_id = patient.id
=begin
      patient_obj.account_number = account.account_number
      patient_obj.account_type = account.account_type.name
      patient_obj.account_relationship = account.relationship
      patient_obj.effective_date = account.effective_date.strftime('%d-%b-%Y')
      patient_obj.cover_period_start_date = account.cover_period_start_date.strftime('%d-%b-%Y')
      patient_obj.cover_period_end_date = account.cover_period_end_date.strftime('%d-%b-%Y')
=end
      results << patient_obj 
    end

    return results
  end

  def self.get_patient(person_id)
    patient = Patient.find(person_id)
    names = patient.person.names.last rescue []
    first_name = names.given_name
    last_name = names.family_name

    account = Account.where(patient_id: patient.patient_id).first rescue nil

    patient_obj = PatientBean.new('')
    patient_obj.given_name = first_name
    patient_obj.family_name = last_name 
    patient_obj.birthdate = patient.person.birthdate.strftime('%d-%b-%Y')
    patient_obj.age = patient.person.age
    patient_obj.gender = patient.person.gender
    patient_obj.patient_id = patient.id
    patient_obj.account_number = account.account_number unless account.blank?
=begin
    patient_obj.account_type = account.account_type.name
    patient_obj.account_relationship = account.relationship
    patient_obj.effective_date = account.effective_date.strftime('%d-%b-%Y')
    patient_obj.cover_period_start_date = account.cover_period_start_date.strftime('%d-%b-%Y')
    patient_obj.cover_period_end_date = account.cover_period_end_date.strftime('%d-%b-%Y')
=end
    return patient_obj 
  end

  def self.clients_with_accounts
    results = []

    (Account.limit(100) || []).each do |account|
      patient = Patient.find(account.patient_id)
      names = patient.person.names.last rescue []
      first_name = names.given_name
      last_name = names.family_name

      patient_obj = PatientBean.new('')
      patient_obj.given_name = first_name
      patient_obj.family_name = last_name 
      patient_obj.birthdate = patient.person.birthdate.strftime('%d-%b-%Y')
      patient_obj.age = patient.person.age
      patient_obj.gender = patient.person.gender
      patient_obj.patient_id = patient.id
      patient_obj.account_number = account.account_number
      patient_obj.effective_date = account.effective_date.strftime('%d-%b-%Y')
=begin
      patient_obj.account_type = account.account_type.name
      patient_obj.account_relationship = account.relationship
      patient_obj.cover_period_start_date = account.cover_period_start_date.strftime('%d-%b-%Y')
      patient_obj.cover_period_end_date = account.cover_period_end_date.strftime('%d-%b-%Y')
=end
      results << patient_obj 
    end

    return results
  end

end
