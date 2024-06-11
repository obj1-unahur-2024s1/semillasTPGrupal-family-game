import semillas.*


class Parcela {
    const property ancho 
    const property largo 
    const property cantidadDeSolQueRecive 
    const plantasQueTiene = []

    method agregarPlanta(unaPlanta) {
        plantasQueTiene.add(unaPlanta)
      
    }

    method quitarPlanta(unaPlanta) {
        plantasQueTiene.remove(unaPlanta)
      
    }
    
    method superficie() = ancho * largo

    method cantidadMaximaDePlantas() = if(ancho > self.largo()) self.superficie()/5 else self.superficie()/3 + self.largo()

    method tieneComplicaciones() = plantasQueTiene.any({planta => planta.cantDeHorasDeToleranciaAlSol() < self.cantidadDeSolQueRecive()})
  
    method puedoPlantar(unaPlanta)=if(self.estanLasCondicionesParaPlantar(unaPlanta)) self.agregarPlanta(unaPlanta) else {"error"}

    method LasPlantasSuperanMetroYMedio() = plantasQueTiene.all({planta => planta.altura()>1.5})

    method estanLasCondicionesParaPlantar(unaPlanta)= plantas.size() < self.cantidadMaximaDePlantas() and not((cantidadDeSolQueRecive  - unaPlanta.cuantasHorasSolTolera())>=2)

    method esBajita() = plantasQueTiene.all({planta => planta.altura() < 1.5})
    
    method monocultivo(unaPlanta) = plantasQueTiene.size() == 1 && plantasQueTiene.all({planta => planta.nombre() == unaPlanta.nombre()})

    method sumaDePlantas() = plantasQueTiene.size()
    
}

class Ecologica inherits Parcela {

    method bienAsociadas() = self.tieneComplicaciones() and plantasQueTiene.parcelaIdeal(self)
  
}

class Industrial inherits Parcela {

    method bienAsociadas() = plantasQueTiene.size() <= 2 and plantasQueTiene.all({planta => planta.esFuerte()})

}