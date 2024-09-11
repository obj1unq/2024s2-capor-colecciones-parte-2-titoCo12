
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
    method poder(personaje) {
        personaje
    }

}

object libro {
    
    method poder(_poder) {
        return 0
    }
}