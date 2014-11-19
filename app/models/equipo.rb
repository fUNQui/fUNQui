class Equipo
	include DataMapper::Resource
	
	  property :id, Serial
  	property :nombre, String
  	property :jugadores, String
  	property :dt, String
  	belongs_to :torneo

    validates_presence_of :nombre
    validates_presence_of :jugadores
    validates_presence_of :dt

    def torneoo
      torneo
    end

    def torneoo=(a_torneo)
      self.torneo = a_torneo
    end
end