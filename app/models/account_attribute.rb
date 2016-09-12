class AccountAttribute < ActiveRecord::Base
  self.table_name = "account_attributes"
  include BillingHelper

  default_scope { where(voided: 0) }

  belongs_to :account, class_name: 'Account', foreign_key: 'account_id'
  has_many :insurance_plans, class_name: 'HealthInsurancePlan', foreign_key: 'insurance_plan_id'

end
