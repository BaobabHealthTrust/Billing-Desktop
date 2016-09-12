class CreateAccountAttributes < ActiveRecord::Migration
  def change
    create_table :account_attributes, :primary_key => :account_attribute_id do |t|
      t.integer   :account_id, :null => false
      t.integer   :insurance_plan_id, :null => false
      t.string    :insurer_plan_identifier, :null => false
      t.boolean   :voided, :null => false, :default => false
      t.string    :void_reason
      t.integer   :creator, :null => false 
      t.integer   :changed_by 
      t.datetime  :date_created
      t.datetime  :date_changed
    end
  end

  def self.down
    drop_table :account_attributes
  end

end
