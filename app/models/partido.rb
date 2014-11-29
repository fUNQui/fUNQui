class Partido
	include DataMapper::Resource
	
	property :id, Serial
	property :resultado , String
	belongs_to :equipoA, Equipo
	belongs_to :equipoB, Equipo 
	belongs_to :torneo


	def torneoo
      torneo
    end

    def torneoo=(a_torneo)
      self.torneo = a_torneo
    end
end