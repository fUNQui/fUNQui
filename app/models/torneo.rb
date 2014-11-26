class Torneo
	include DataMapper::Resource
	
	property :id, Serial
  	property :nombre, String
  	property :fecha, Date
  	property :lugar, String
  	property :comentario, String
    has n, :equipos
    has n, :partidos

    validates_presence_of :nombre
    validates_presence_of :fecha
    validates_presence_of :lugar

  def self.generar_partidos (torneo)
    e = Equipo.all(:torneo => torneo).count
    (0..(e - 1)).each do |n|
      Torneo.generar_partidos_para(n,torneo)
    end 
  end

  def self.generar_partidos_para (n, torneo)
    eqs = Equipo.all(:torneo => torneo)
    e = Equipo.all(:torneo => torneo).count
    ((n+1)..(e - 1)).each do |i|
      @partido = Partido.new
      @partido.equipoA = eqs[n]
      @partido.equipoB = eqs[i]
      @partido.resultado = nil
      @partido.torneo = torneo
      @partido.save
    end
  end
end
