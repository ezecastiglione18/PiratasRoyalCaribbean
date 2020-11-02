class Barco {
	var resistencia
	var poderDeFuego
	var cantidadMuniciones
	var tripulacion
	var bando
	var property estaDesolado = false
	
	method capitan(){
		return tripulacion.max( {pirata => pirata.poderDeMando()} )
	}
	
	method enfrentarA(otroBarco){
		if(!self.estaDesolado() && !otroBarco.estaDesolado()){
			self.enfrentarseContra(otroBarco)
		}
	}
	
	method enfrentarseContra(otroBarco){
		if(self.sumatoriaFuerza() >= otroBarco.sumatoriaFuerza()){
			self.ganarleA(otroBarco)
		}
		else
		{
			otroBarco.ganarleA(self)
		}
	}
	
	method sumatoriaFuerza(){
		return tripulacion.sum( {pirata => pirata.poderDeMando()} )
	}
	
	method ganarleA(barcoPerdedor){
		self.herirTripulacion()
		self.sumarTripulacion(barcoPerdedor)
		barcoPerdedor.perderTripulacion()
		barcoPerdedor.desolar()
	}
	
	method herirTripulacion(){
		tripulacion.forEach( {pirata => pirata.herir()} )
	}
	
	method sumarTripulacion(otroBarco){
		const tripulacionFuerte = otroBarco.tripulacionFuerte()
		tripulacion.addAll(tripulacionFuerte)
	}
	
	method tripulacionFuerte(){
		return tripulacion.filter( {pirata => pirata.poderDeMando() > 100} )
	}
	
	method perderTripulacion(){
		tripulacion.clear()
	}
	
	method desolar(){
		resistencia = 0
		poderDeFuego = 0
		cantidadMuniciones = 0
		estaDesolado = true
	}
	
	method dispararleA(otroBarco, unaCantidad){
		if(self.puedeDisparar(unaCantidad)){
			self.disparar(unaCantidad)
			otroBarco.sufrirDanio(unaCantidad)
			otroBarco.eliminarDebiles()
		}
		else
		{
			throw new Exception(message = "No puede disparar esa cantidad")
		}
	}
	
	method puedeDisparar(unaCantidad){
		return cantidadMuniciones - unaCantidad > 0
	}
	
	method disparar(unaCantidad){
		cantidadMuniciones = cantidadMuniciones - unaCantidad
	}
	
	method sufrirDanio(unaCantidad){
		resistencia -= 50 * unaCantidad
	}
	
	method eliminarDebiles(){
		tripulacion.removeAllSuchThat( {pirata => pirata.energia() < 20} )
	}
	
	method aplicarBonus(){
		bando.aplicarBonus(self)
	}
	
	method aumentarMunicion(){
		cantidadMuniciones *= 1.3
	}
	
	method aumentarPoderFuego(){
		poderDeFuego *= 1.6
	}
	
	method duplicarTripulacion(){
		tripulacion.addAll(tripulacion)
	}
}
