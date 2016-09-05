class HealthInsurancePlan < ActiveRecord::Base
  self.table_name = "health_insurance_plans"
  include BillingHelper

  default_scope { where(voided: 0) }

  belongs_to :health_insurance, class_name: "HealthInsurance", foreign_key: "insurance_id"

end
