class PatientIdentifier < ActiveRecord::Base
 self.table_name ='patient_identifier'
  
  default_scope { where(voided: 0) }
  
  belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
end
