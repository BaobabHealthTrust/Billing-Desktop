class PatientIdentifierType < ActiveRecord::Base
  self.table_name ='patient_identifier_type'
  
  default_scope { where(voided: 0) }
  
  has_many :patient_identifiers, class_name: 'PatientIdentifier', foreign_key: 'identifier_type'

end
