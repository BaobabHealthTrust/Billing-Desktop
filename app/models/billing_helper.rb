module BillingHelper
=begin
  before_save self.changed_by = User.current.id if self.attributes.has_key?("changed_by") and User.current != nil
  before_save self.changed_by = User.first if self.attributes.has_key?("changed_by") and User.current.nil?
  before_save self.date_changed = Time.now if self.attributes.has_key?("date_changed")
=end

  def self.included(base)
    base.class_eval do
      before_create :check_record_complteness_before_creating
      before_save :check_record_complteness_before_updating
    end
  end
 
  def check_record_complteness_before_creating
    self.creator = User.current.id if self.attribute_names.include?("creator") \
    and (self.creator.blank? || self.creator == 0)and User.current != nil
    self.date_created = Time.now if self.attribute_names.include?("date_created")
  end
  
  def check_record_complteness_before_updating
    self.changed_by = User.current.id if self.attribute_names.include?("changed_by") \
    and (self.creator.blank? || self.creator == 0)and User.current != nil
  end

end
