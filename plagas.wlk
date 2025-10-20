/*
class Padre{}

class hijo inherits Padre{}

Lo importante es saber cuándo usar herencia y cuándo no

*/

class Plaga {
  const poblacion
  method transmiteEnfermedad() = poblacion >= 10
}

class PlagaDeCucarachas inherits Plaga{
  const pesoPromedio
  
  // clase hijo accede al atributo del padre 
  method nivelDeDanio() = poblacion/2
  
  // voy a sobreescribir el método del padre. Para referirnos al método del padre usamos super()
  override method transmiteEnfermedad() = super() and pesoPromedio >= 10

}

class PlagaDePulgas inherits Plaga{
  method nivelDeDanio() = poblacion*2

}

class PlagaDeGarrapatas inherits PlagaDePulgas {

}

class PlagaDeMosquitos inherits Plaga{
  method nivelDeDanio() = poblacion
  override method transmiteEnfermedad() = super() and poblacion % 3 == 0
}

