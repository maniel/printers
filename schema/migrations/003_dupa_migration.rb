# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://sequel.rubyforge.org/rdoc/classes/Sequel/Database.html#M000607

class DupaMigration < Sequel::Migration

  def up
    create_table :dupas do
      primary_key :id
      flag :flaga
      text :nazwa
    end
  end

  def down
    drop_table :dupas
  end

end
