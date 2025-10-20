import plagas.*

class Hogar{
  var nivelDeMugre
  const confort
  method esBuena() =  nivelDeMugre <= confort/2
  
  // inyección de dependencias
  method recibirAtaque(plaga){ 
    nivelDeMugre += plaga.nivelDeDanio()
  }
}

class Huerta {
  var capacidadDeProduccion
  // otra opción era definir un objeto nivelDeProduccion
  const nivelDeProduccion = 100
  method esBuena() = capacidadDeProduccion > nivelDeProduccion

  // inyección de dependencias
  method recibirAtaque(plaga){
    capacidadDeProduccion = capacidadDeProduccion -0.1*plaga.nivelDeDanio()
  }

}

class Mascota {
  var nivelDeSalud
  method esBuena() = nivelDeSalud > 250

  method recibirAtaque(plaga){
    if (plaga.transmiteEnfermedad()) {
      nivelDeSalud -= plaga.nivelDeDanio()
    } 
  }
}

class Barrio {
  const elementos = []
  method losBuenos() = elementos.filter{e => e.esBuena()}
  method losMalos() = elementos.filter{e => not e.esBuena()}
  method esCopado() = self.losBuenos().size() > self.losMalos().size()
}

