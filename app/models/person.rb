class Person < ActiveRecord::Base
   self.table_name ='person'
  
  default_scope { where(voided: 0) }
  
  has_one :patient, class_name: "Patient", foreign_key: "patient_id"
  has_many :names, class_name: 'PersonName', foreign_key: 'person_id'
  has_many :addresses, class_name: 'PersonAddress', foreign_key: 'person_id'
  has_many :person_attributes, class_name: 'PersonAttribute', foreign_key: 'person_id'

  def age(today = Date.today)
    #((Time.now - self.birthdate.to_time)/1.year).floor
    # Replaced by Jeff's code which better accounts for leap years

    return nil if self.birthdate.nil?

    patient_age = (today.year - self.birthdate.year) + ((today.month - self.birthdate.month) + ((today.day - self.birthdate.day) < 0 ? -1 : 0) < 0 ? -1 : 0)
   
    birth_date = self.birthdate
    estimate = self.birthdate_estimated
    if birth_date.month == 7 and birth_date.day == 1 and estimate == 1 and Time.now.month < birth_date.month and self.date_created.year == Time.now.year
       return patient_age + 1
    else
       return patient_age
    end     
  end

end
