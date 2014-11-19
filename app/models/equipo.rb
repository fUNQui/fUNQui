class Equipo
	include DataMapper::Resource
	
	property :id, Serial
  	property :nombre, String
  	property :jugadores, String
  	property :dt, String

    validates_presence_of :nombre
    validates_presence_of :jugadores
    validates_presence_of :dt
end