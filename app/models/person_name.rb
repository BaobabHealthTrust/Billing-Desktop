class PersonName < ActiveRecord::Base
  
  self.table_name ='person_name'
  
  default_scope { where(voided: 0) }
  
  belongs_to :person, class_name: 'Person', foreign_key: 'person_id'
  has_one :person_name_code, class_name: "PersonNameCode", foreign_key: "person_name_id"

end
