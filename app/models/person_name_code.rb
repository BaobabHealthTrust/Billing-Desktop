class PersonNameCode < ActiveRecord::Base
  self.table_name ='person_name_code'
  
  belongs_to :person_name, class_name: "PersonName", foreign_key: "person_name_id"
  
end
