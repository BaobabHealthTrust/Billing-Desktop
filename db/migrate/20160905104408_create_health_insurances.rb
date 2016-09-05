class CreateHealthInsurances < ActiveRecord::Migration
  def change
    create_table :health_insurances, :primary_key => :insurance_id do |t|
      t.string     :name, :null => false
      t.text       :description
      t.boolean    :voided, :null => false, :default => false
      t.string     :void_reason
      t.integer    :creator, :null => false 
      t.integer    :changed_by 
      t.datetime   :date_created
      t.datetime   :date_changed
    end
  end

  def self.down
    drop_table :health_insurances
  end

end
