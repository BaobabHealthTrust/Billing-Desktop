class Patient < ActiveRecord::Base
  self.table_name ='patient'

  default_scope { where(voided: 0) }

  has_one :person, class_name: "Person", foreign_key: "person_id"
  has_many :patient_identifiers, class_name: 'PatientIdentifier', foreign_key: 'patient_id'

end
