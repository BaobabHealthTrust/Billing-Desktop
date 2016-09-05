class CreateHealthInsurancePlans < ActiveRecord::Migration
  def change
    create_table :health_insurance_plans, :primary_key => :insurance_plan_id do |t|
      t.integer    :insurance_id, :null => false
      t.string     :name, :null => false
      t.text       :description
      t.float      :cover_percentage, :null => false, :default => 0
      t.boolean    :voided, :null => false, :default => false
      t.string     :void_reason
      t.integer    :creator, :null => false 
      t.integer    :changed_by 
      t.datetime   :date_created
      t.datetime   :date_changed
    end
  end

  def self.down
    drop_table :health_insurance_plans
  end

end
