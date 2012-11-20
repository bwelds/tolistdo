class AddReconfirmableEmail < ActiveRecord::Migration
  
  def up
  	change_table(:users) do |t|
	  	## Confirmable
	   
	    t.string   :unconfirmed_email # Only if using reconfirmable
	end
  end

  def down
  end
end
