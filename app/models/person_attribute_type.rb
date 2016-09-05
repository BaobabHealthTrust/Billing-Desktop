class PersonAttributeType < ActiveRecord::Base
  self.table_name ='person_attribute_type'
  
  default_scope { where(voided: 0) }
  
  has_many :person_attributes
end
