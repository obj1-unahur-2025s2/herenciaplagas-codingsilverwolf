import plagas.*

class Hogar{
  var nivelDeMugre
  const confort
  method esBuena() =  nivelDeMugre <= confort/2
  
  // inyección de dependencias
  method recibirAtaqueDe(plaga){ 
    nivelDeMugre += plaga.nivelDeDanio()
  }
}

class Huerta {
  var capacidadDeProduccion
  // otra opción era definir un objeto nivelDeProduccion
  const nivelDeProduccion = 100
  method esBuena() = capacidadDeProduccion > nivelDeProduccion

  // inyección de dependencias
  method recibirAtaqueDe(plaga){
    capacidadDeProduccion = 0.max(capacidadDeProduccion -0.1*plaga.nivelDeDanio())
    capacidadDeProduccion = 0.max(capacidadDeProduccion - if (plaga.transmiteEnfermedad()) 10 else 0)
  }

}

class Mascota {
  var nivelDeSalud
  method esBuena() = nivelDeSalud > 250

  method recibirAtaqueDe(plaga){
    if (plaga.transmiteEnfermedad()) {
      nivelDeSalud = 0.max(nivelDeSalud - plaga.nivelDeDanio())
    } 
  }
}

class Barrio {
  const elementos = []
  method losBuenos() = elementos.filter{e => e.esBuena()}
  method losMalos() = elementos.filter{e => not e.esBuena()}
  method esCopado() = self.losBuenos().size() > self.losMalos().size()
}

