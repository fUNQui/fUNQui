class Torneo
	include DataMapper::Resource
	
	property :id, Serial
  	property :nombre, String
  	property :fecha, String
  	property :comentario, String

  	validates_presence_of :nombre
  	validates_presence_of :fecha
end