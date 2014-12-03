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
    
    def self.sacar_puntos(resultados,partido)
    	if (resultados[0].to_i > resultados[1].to_i)
				partido.equipoA.puntos = partido.equipoA.puntos - 3 
			else 
				if (resultados[0].to_i < resultados[1].to_i)
					partido.equipoB.puntos = partido.equipoB.puntos - 3 
				else
					partido.equipoA.puntos = partido.equipoA.puntos - 1 
					partido.equipoB.puntos = partido.equipoB.puntos - 1 
				end
			end
    end

    def self.ingresar_puntos(resultados,partido)
    	if (resultados[0].to_i > resultados[1].to_i)
				partido.equipoA.puntos = partido.equipoA.puntos + 3 
			else 
				if (resultados[0].to_i < resultados[1].to_i)
					partido.equipoB.puntos = partido.equipoB.puntos + 3 
				else
					partido.equipoA.puntos = partido.equipoA.puntos + 1 
					partido.equipoB.puntos = partido.equipoB.puntos + 1 
				end
			end
    end

    def self.actualizar_puntos (partido, resultado_partido_viejo)
		if (resultado_partido_viejo === "-")
			resultados = partido.resultado.split("-")
			Partido.ingresar_puntos(resultados,partido)
		else
			resultados = resultado_partido_viejo.split("-")
			Partido.sacar_puntos(resultados,partido)

			resultados = partido.resultado.split("-")
			Partido.ingresar_puntos(resultados,partido)
		end
	end
end