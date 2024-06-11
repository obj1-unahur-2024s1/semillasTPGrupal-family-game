import parcelas.*
import plantas2.*
import parcela2.*


object inta {
const property coleccionDeParcelas = []
method agregarALaColeccion(unaParcela) =
coleccionDeParcelas.add(unaParcela)
method quitarDeLaColeccion(unaParcela) =
coleccionDeParcelas.remove(unaParcela)
method promedioDePlantas() =
coleccionDeParcelas.sum({parcela => parcela.cantidadDePlantas()}) /
coleccionDeParcelas.size()
method masAutosustentable(){
const mayorA4 = coleccionDeParcelas.filter({parcela => parcela.cantidadDePlantas()
> 4})
return mayorA4.max({p=>p.porcentajeDeBienAsociadas()})}
}