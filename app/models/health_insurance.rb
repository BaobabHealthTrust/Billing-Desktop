class HealthInsurance < ActiveRecord::Base
  self.table_name = "health_insurances"
  include BillingHelper

  default_scope { where(voided: 0) }

  has_many :insurance_plans, class_name: 'HealthInsurancePlan', foreign_key: 'insurance_id'


end
