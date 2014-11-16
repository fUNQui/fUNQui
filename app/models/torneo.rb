class Torneo
	include DataMapper::Resource
	
	property :id, Serial
  	property :nombre, String
  	property :fecha, String
  	property :lugar, String
  	property :comentario, String

  	validates_presence_of :nombre
  	validates_presence_of :fecha
  	validates_presence_of :lugar
end
