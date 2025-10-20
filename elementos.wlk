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
  const nivelDeProduccion
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

