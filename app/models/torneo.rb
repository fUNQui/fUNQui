class Torneo
	include DataMapper::Resource
	
	property :id, Serial
  	property :nombre, String
  	property :fecha, Date
  	property :lugar, String
  	property :comentario, String
    has n, :equipos

  	validates_presence_of :nombre
  	validates_presence_of :fecha
  	validates_presence_of :lugar
end
