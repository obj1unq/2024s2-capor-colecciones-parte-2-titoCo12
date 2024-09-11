import artefactos.*


object castillo {
	
	const property artefactos = #{}
		
	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}
	
}


object rolando {

	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo
	const property historia = []
	var poderBase = 5

	method poderBase() {
		return poderBase 
	}

	method poderArtefactos() {
		return artefactos.sum({artefacto => artefacto.poder(self)})
	}

	method poderDePelea() {
		return poderBase + self.poderArtefactos()
	}

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
		
}

