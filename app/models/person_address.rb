class PersonAddress < ActiveRecord::Base
  self.table_name ='person_address'
  
  default_scope { where(voided: 0) }
  
  belongs_to :person, class_name: "Person", foreign_key: "person_id"
  
end
