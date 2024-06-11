import parcelas.*
import semillas2.*


object inta {
    const property coleccionDeParcelas = []

    method agregarALaColeccion(unaParcela) {
        coleccionDeParcelas.add(unaParcela)
      
    }

    method quitarDeLaColeccion(unaParcela) {
        coleccionDeParcelas.remove(unaParcela)
      
    }
    method promedioDePlantas() = coleccionDeParcelas.sum({parcela => parcela.sumaDePlantas()}) / coleccionDeParcelas.size()

    method masAutosustentable() = coleccionDeParcelas.map({parcela => parcela.sumaDePlantas() > 4}).bienAsociadas()
    // nose si es la manera correcta
  
}