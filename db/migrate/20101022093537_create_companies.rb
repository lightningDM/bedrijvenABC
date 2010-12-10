class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :ondernemingsnummer
      t.string :naam
      t.string :logo_url
      t.string :straat
      t.string :huisnummer
      t.string :gemeente
      t.string :contactpersoon
      t.string :email
      t.string :telefoonnummer
      t.text :beschrijving
      t.string :sector
      t.string :regio
      t.string :website
      t.text :geschiedenis
      t.string :maandag
      t.string :dinsdag
      t.string :woensdag
      t.string :donderdag
      t.string :vrijdag
      t.string :zaterdag
      t.string :zondag
      t.string :wachtwoord

      t.timestamps
    end

end

  def self.down
    drop_table :companies
   
  end
end
