class Company < ActiveRecord::Base
  REGIOS = ["West-Vlaanderen", "Oost-Vlaanderen","Antwerpen", "Limburg", "Vlaams-Brabant","Brussel", "Waals-Brabant","Henegouwen", "Luxemburg","Namen", "Luik"]
 SECTORS = ["Aannemers","Aanwervingsbureau","Accountants","Aandrijving","Aanhangwagens",
"Aandrijving","Voeding","Advocaten","Sanitair","Aluminium","Apotheker","Artiesten","Auto","Baby","Cafe","Casino","Dokter","Deegwaren",
"Detectives","Houtbewerking","Juwelier","Doe-Het-Zelf","Tankstation","Elektrecien","Elektro","Restaurant","Eetcafe","Fietsen","Feestartikelen","Foto","Fitness",
"Frituren","Gas","Geluid","Licht","Metaal","Bouw","Tuincenter","Tuin","GSM","Computers","Groenten&Fruit","Kapsalon",
"Schoenen","Energie","Hout","Huisdieren","Huishouden","Immobilien","Internet","Informatica","Isolatie","Interieur","Kachels",
"Kampeerterrein","Keukens","Kinderanimatie","Koper","Schilder","Reclame","Video","Muziek","Sport","Notarissen","Onderwijs","Rusthuizen",
"Scheepvaart","Tabak","Snack-Bar", "Software","Tandarts","Televisie","Veehandel","Transport","Drank","eten","Vije Tijd", "Onderhoud","Drinken" ]
	def self.search_by_name(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['naam LIKE ?', search_condition])
	end
	def self.search_by_nummer(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['ondernemingsnummer LIKE ?', search_condition])
	end
end
class Regio < ActiveRecord::Base
end
