import parcelas.*

class Planta {

    const property anioDeObtencion  
    var property altura  

    method nombre() 

    method esFuerte() = self.cantDeHorasDeToleranciaAlSol() > 10

    method daNuevasSemillas() = self.esFuerte() || self.condicionAlternativa()

    method espacioRequerido() 

    method cantDeHorasDeToleranciaAlSol() 

    method condicionAlternativa()

}

class Menta inherits Planta {

    override method nombre() = "Menta"

    override method daNuevasSemillas() = self.condicionAlternativa()

    override method espacioRequerido() = self.altura() * 3

    override method cantDeHorasDeToleranciaAlSol() = 6

    override method condicionAlternativa() = self.altura() > 0.4

    method parcelaIdeal(unaParcela) = unaParcela.superficie() > 6

}

class HierbaBuena inherits Menta {

    override method nombre() = "Hierba Buena"

    override method espacioRequerido() = super() * 2
  
}

class Soja inherits Planta {
    override method nombre() = "Soja"

    override method cantDeHorasDeToleranciaAlSol() = if(self.altura() < 0.5){6} else if (self.altura().between(0.5, 1)){7} else{9}
    
    override method daNuevasSemillas() = self.condicionAlternativa()

    override method condicionAlternativa() = self.anioDeObtencion() > 2007 and self.altura() > 1

    override method espacioRequerido() = self.altura() / 2

    method parcelaIdeal(unaParcela) = unaParcela.tieneComplicaciones()
}

class SojaTrangenica inherits Soja {

    override method nombre() = "Soja Trangenica"

    override method daNuevasSemillas() = false

    method parcelaIdeal(unaParcela) = unaParcela.monocultivo()
  
}

class Quinua inherits Planta {

    override method nombre() = "Quinua"

    override method espacioRequerido() = 0.5

    override method daNuevasSemillas() = self.anioDeObtencion() > 2005
  
    method parcelaIdeal(unaParcela) = unaParcela.esBajita()
}
