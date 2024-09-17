
object erethia {
    const habitantes = #{archibaldo,caterina,astra}

    method poderoso(personaje) {
        return habitantes.all({habitante => personaje.puedeVencer(habitante)})
    }

    method conquistables(personaje){
        return self.vencibles(personaje).map({habitante => habitante.casa()}).asSet()
    }

     method vencibles(personaje){
        return habitantes.filter({habitante => personaje.puedeVencer(habitante)})
    }
}


object palacio {}

object archibaldo {
    const property casa = palacio

    method poderDePelea() {
        return 16
    }
}


object fortaleza {}

object caterina {
    const property casa = fortaleza

    method poderDePelea() {
        return 28
    }
}


object torre {}

object astra {
    const property casa = torre

    method poderDePelea() {
        return 14
    }
}
