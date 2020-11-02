class Pirata {
	var property energia
	
	method poderDeMando(){
		return 1
	}
	
	method leAfectoElRon(){
		energia -= 50
		self.leRoboIngrediente()
	}
	
	method leRoboIngrediente(){
		
	}
	
	method herir(){
		
	}
}

class Guerrero inherits Pirata {
	var poderPelea
	var vitalidad
	
	override method poderDeMando(){
		return poderPelea * vitalidad
	}
	
	override method herir(){
		poderPelea = poderPelea / 2
	}
}

class Navegador inherits Pirata {
	var inteligencia
	
	override method poderDeMando() = return inteligencia*inteligencia
	
	override method herir(){
		inteligencia = inteligencia / 2
	}
}

class Cocinero inherits Pirata {
	var moral
	var ingredientes
	
	override method poderDeMando(){
		return self.cantidadIngredientes() * moral
	}
	
	method cantidadIngredientes(){
		return ingredientes.size()
	}
	
	override method leRoboIngrediente(){
		const objetoRobado = ingredientes.anyOne()
		jackSparrow.agregarIngrediente(objetoRobado)
	}
	
	override method herir(){
		moral = moral / 2
	}
}
//--------------------------------
object jackSparrow{
	var energia = 500
	var poderPelea = 200
	var inteligencia = 300
	var ingredientes = [botellaRon]
	
	method poderDeMando(){
		return energia * poderPelea * inteligencia
	}
	
	method tomarRonCon(otroPirata){
		energia = energia + 100
		otroPirata.leAfectoElRon()
	}
	
	method agregarIngrediente(unIngrediente){
		ingredientes.add(unIngrediente)
	}
}

object botellaRon{
	
}