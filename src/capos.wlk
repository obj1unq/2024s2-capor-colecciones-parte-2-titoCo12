import artefactos.*
import enemigos.*

object castillo {
	const property artefactos = #{}
		
	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}

	method artefactoMasFuerte(personaje) {
		return artefactos.max({artefacto => artefacto.poder(personaje)})
	}
}




object rolando {
	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo
	const property historia = []
	var poderBase = 5

//----------------------------------------------------

	method poderDePelea() {
		return poderBase + self.poderArtefactos()
	}

	method poderArtefactos() {
		return artefactos.sum({artefacto => artefacto.poder(self)})
	}

	method poderBase() {
		return poderBase 
	}
	
	method poderBase(_poderBase) {
		poderBase = _poderBase
	}

//----------------------------------------------------

	method encontrar(artefacto) {
		if(artefactos.size() < capacidad) {
			artefactos.add(artefacto)
		}
		historia.add(artefacto)
	}

	method volverACasa() {
		casa.agregarArtefactos(artefactos)
		artefactos.clear()
	}	

	method posesiones() {
		return self.artefactos() + casa.artefactos()
	}
	
	method posee(artefacto) {
		return self.posesiones().contains(artefacto)	
	}
		
//----------------------------------------------------

	method luchar() {
		self.usarArtefactos()
		poderBase += 1
	}

	method usarArtefactos(){
		artefactos.forEach({artefacto => artefacto.serUsado() })
	}

//----------------------------------------------------

	method artefactoMasFuerteDeHogar() {
		return casa.artefactoMasFuerte(self)
	}

//----------------------------------------------------

	
	method tieneArmaFatal(enemigo){
		return artefactos.any({artefacto => artefacto.poder(self) > enemigo.poderDePelea()})
	}
	
	method armaFatal(enemigo){
		return artefactos.find({artefacto => artefacto.poder(self) > enemigo.poderDePelea()})
	}

	method puedeVencer(enemigo){
		return self.poderDePelea() > enemigo.poderDePelea()
	}
}

