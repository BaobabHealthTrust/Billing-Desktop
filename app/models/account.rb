class Account < ActiveRecord::Base
  self.table_name = "accounts"
  include BillingHelper

  default_scope { where(voided: 0) }

  belongs_to :patient, class_name: 'Patient', foreign_key: 'patient_id'
end
