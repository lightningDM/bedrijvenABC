class Company < ActiveRecord::Base

 validates :naam, :presence => true, :uniqueness => true
 
 REGIOS = ["West-Vlaanderen", "Oost-Vlaanderen","Antwerpen", "Limburg", "Vlaams-Brabant","Brussel", "Waals-Brabant","Henegouwen", "Luxemburg","Namen", "Luik"]
 SECTORS = ["Aannemers","Aanwervingsbureau","Accountants","Aandrijving","Aanhangwagens",
"Aandrijving","Voeding","Advocaten","Sanitair","Aluminium","Apotheker","Artiesten","Auto","Baby","Cafe","Casino","Dokter","Deegwaren",
"Detectives","Houtbewerking","Juwelier","Doe-Het-Zelf","Tankstation","Elektrecien","Elektro","Restaurant","Eetcafe","Fietsen","Feestartikelen","Foto","Fitness",
"Frituren","Gas","Geluid","Licht","Metaal","Bouw","Tuincenter","Tuin","GSM","Computers","Groenten&Fruit","Kapsalon",
"Schoenen","Energie","Hout","Huisdieren","Huishouden","Immobilien","Internet","Informatica","Isolatie","Interieur","Kachels",
"Kampeerterrein","Keukens","Kinderanimatie","Koper","Schilder","Reclame","Video","Muziek","Sport","Notarissen","Onderwijs","Rusthuizen",
"Scheepvaart","Tabak","Snack-Bar", "Software","Tandarts","Televisie","Veehandel","Transport","Drank","eten","Vije Tijd", "Onderhoud","Drinken" ]

 
	# Include default devise modules. Others available are:
  	# :token_authenticatable, :confirmable, :lockable and :timeoutable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
  	attr_accessible :email, :password, :password_confirmation, :remember_m, :naam, :ondernemingsnummer, :logo_url, :straat, :huisnummer, :gemeente, :contactpersoon, :telefoonnummer, :beschrijving, :sector, :regio, :website, :geschiedenis,
       :maandag,
       :dinsdag,
       :woensdag,
       :donderdag,
       :vrijdag,
       :zaterdag,
       :zondag

	def self.search_all(name, nummer, regioNummer, sectorNummer)
		
		regio_condition = "%" + regioNummer + "%"
		sector_condition = "%" + sectorNummer + "%"
		name_condition = "%" + name + "%"
		nummer_condition = "%" + nummer + "%"

		find(:all, :conditions => ['(naam LIKE ? and ondernemingsnummer LIKE ? and regio LIKE ? and sector LIKE ?)', name_condition, nummer_condition, regio_condition, sector_condition])

	end
end
class Regio < ActiveRecord::Base
end
