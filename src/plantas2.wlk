import inta.*
import inta2.*
import parcelas.*
import parcela2.*

class Planta {
	const property anioObtencion
	var property altura
	
	method cuantasHorasSolTolera()
	method esFuerte()=self.cuantasHorasSolTolera()>10
	method daNuevasSemillas()=self.esFuerte()or self.condicionAlternativa()
	method espacioQueOcupa()
	method condicionAlternativa()


	method seAsociaBienAEcologica(unaParcela){return not unaParcela.tieneComplicaciones() and self.parcelaIdeal(unaParcela)}
	method parcelaIdeal(unaParcela)
	method seAsociaBienAIndustrial(unaParcela)=unaParcela.cantidadDePlantasEnParcela()<=2 and self.esFuerte()
}
class Menta inherits Planta{
override method cuantasHorasSolTolera()=6
override method condicionAlternativa()= altura > 0.4
override method espacioQueOcupa()= altura*3


override method parcelaIdeal(unaParcela)=unaParcela.superficie()>6
}


class Soja inherits Planta{
override method cuantasHorasSolTolera()=
if(altura< 0.5){6}
else if(altura.between(0.5,1)){7}
else {9}
override method condicionAlternativa()=anioObtencion>2007 and altura >1
override method espacioQueOcupa()= altura/2


override method parcelaIdeal(unaParcela)=unaParcela.horasSol() == self.cuantasHorasSolTolera()
}


class Quinoa inherits Planta{
const horasQueTolera
override method cuantasHorasSolTolera()=horasQueTolera
override method espacioQueOcupa()=0.5
override method condicionAlternativa()= anioObtencion<2005



override method parcelaIdeal(unaParcela)=not
unaParcela.algunaPlantaSuperaElMetroYMedio()
}


class SojaTransgenica inherits Soja{
override method daNuevasSemillas()=false


override method parcelaIdeal(unaParcela)= unaParcela.cantidadMaximaDePlantas()==1
}

class Hiervabuena inherits Menta{
	override method espacioQueOcupa()=super()*2
}