class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, :primary_key => :account_id do |t|
      t.integer   :patient_id, :null => false
      t.integer   :account_number, :null => false
      t.date      :effective_date
      t.boolean   :voided, :null => false, :default => false
      t.string    :void_reason
      t.integer   :creator, :null => false 
      t.integer   :changed_by 
      t.datetime  :date_created
      t.datetime  :date_changed
    end
  end

  def self.down
    drop_table :accounts
  end

end
