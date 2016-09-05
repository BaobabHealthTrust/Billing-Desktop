class PatientBean 

 attr_accessor :given_name, :middle_name, :family_name, :gender, :birthdate, 
               :cell_phone_number, :office_phone_number, :home_phone_number, 
               :old_identification_number, :patient_id, :age, :pregnancy_status,
               :last_menstrual_period,:estimated_date_of_delivery,:edd, :lmp

 attr_accessor :account_type, :account_number, :account_relationship, :effective_date, 
               :cover_period_start_date, :cover_period_end_date, :date_registered,
               :birthdate_estimated, :inpatient_state


	def initialize(name)
		@name = name
	end
end
