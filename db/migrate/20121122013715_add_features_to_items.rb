class AddFeaturesToItems < ActiveRecord::Migration
  def change

	change_table(:items) do |t|
	  	
	    t.integer	:priority
	    t.datetime 	:due_date
	    t.boolean 	:completed
	    
	end

  end
end
