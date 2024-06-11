import inta.*
import plantas2.*
import inta2.*
class Parcela {
	var ancho
	var largo
	var property horasSol
	const property plantas=[]

	method sacarPlanat(unaPlanta)= plantas.remove(unaPlanta)
	method superficie()=ancho*largo
	method cantidadMaximaDePlantas()= if(ancho>largo)self.superficie()/5 else self.superficie()/3+ largo
	method tieneComplicaciones()= plantas.any({p=>p.cuantasHorasSolTolera()< self.horasSol()})
	method puedoPlantar(unaPlanta){
		if(self.estanLasCondicionesParaPlantar(unaPlanta))
			plantas.add(unaPlanta)
	}
	method algunaPlantaSuperaElMetroYMedio()=plantas.any({p=>p.altura()>1.5})
	method estanLasCondicionesParaPlantar(unaPlanta)= self.cantidadDePlantas()< self.cantidadMaximaDePlantas()and not((horasSol - unaPlanta.cuantasHorasSolTolera())>=2)
	method cantidadDePlantas()= plantas.size()
}

class ParcelaEcologica inherits Parcela{
	method seAsociaBienAEcologica(unaPlanta){return not self.tieneComplicaciones() and unaPlanta.parcelaIdeal(self)}
}
class ParcelaIndustrial inherits Parcela{
	method seAsociaBienAIndustrial() = plantas.size()<2 and plantas.all({p=> p.esFuerte()})
}