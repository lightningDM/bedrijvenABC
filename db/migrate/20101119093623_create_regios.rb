class CreateRegios < ActiveRecord::Migration
  def self.up
    create_table :regios do |t|
      t.string :regioId
      t.string :regioName

      t.timestamps
    end
  end

  def self.down
    drop_table :regios
  end
end
