class PersonAttribute < ActiveRecord::Base
  self.table_name ='person_attribute'
  
  default_scope { where(voided: 0) }
  
  belongs_to :type, class_name: "PersonAttributeType", foreign_key: "person_attribute_type_id"
  belongs_to :person, class_name: "Person", foreign_key: "person_id"

end
