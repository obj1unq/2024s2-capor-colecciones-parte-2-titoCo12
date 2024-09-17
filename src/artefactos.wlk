
object espada{
    var fueUsado = false

    method serUsado() {
        fueUsado = true
    }

    method poder(personaje) {
        return personaje.poderBase() * (self.factorPorUso())
    }

    method factorPorUso() {
        return if (fueUsado) (0.5) 
        else (1)
    }

}



object collar {
    var usos = 0

    method serUsado() {
        usos += 1
    }

    method poder(personaje) {
        return 3 + self.extraPorNivel(personaje)
    }

    method extraPorNivel(personaje) {
        return if (personaje.poderBase() > 6) (usos) else (0)
    }

}



object armadura {
    const poder = 6

    method poder(personaje) {
        return poder
    }

    method serUsado() {
    }

}



object libro {
    var hechizos = []

    method hechizos(_hechizos) {
        hechizos = _hechizos
    }

    method poder(personaje) {
        return if (self.quedanHechizos()) {
            self.hechizoActual().poderHechizo(personaje)
        }
        else {0}
    }
    
    method quedanHechizos() {
        return (not (hechizos.isEmpty()))
    }

    method serUsado() {
        hechizos.remove(self.hechizoActual())
    }

    method hechizoActual() {
        return hechizos.head()
    }
}



object bendicion {
    const poder = 4

    method poderHechizo(personaje) {
        return poder
    } 
}

object invisibilidad {
    
    method poderHechizo(personaje) {
        return personaje.poderBase()
    }
}

object invocacion {

    method poderHechizo(personaje) {
        return personaje.artefactoMasFuerteDeHogar().poder(personaje)
    }
}