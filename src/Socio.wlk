import mutual.*
import libro.*
class Socio{
	const idiomas = []
	var property edad 
	const actividad = []
	var property maximoDeActividadRealizada = 5
	method actividad(){ return actividad}
	method idiomas(){return idiomas}
	method agregarActividad(unaActividad){
		if(actividad.size() < maximoDeActividadRealizada){
			actividad.add(unaActividad)
		}
		else self.error("descripcion del error")
	}
	method esAdoradorDelSol(){
		return actividad.all({a=>a.broncearse()})
	}
	method actividadesEsforzadas(){
		return actividad.filter({a=>a.implicaEsfuerzo()})
	}
	method actividadrealizada(unaAct){
		return actividad.contains(unaAct)	
	}
}
class SocioTranquilo inherits Socio{
	method leAtrae(unaActividad){
		return unaActividad.diasDeViaje() > 4
	}
}
class SocioCoherente inherits SocioTranquilo{
	override method leAtrae(unaActividad){
		return if(self.esAdoradorDelSol()){
			unaActividad.broncearse()
		} else unaActividad.implicaEsfuerzo()
	}
} 

class SocioRelajado inherits SocioTranquilo{
	override method leAtrae(unaActividad){
		return idiomas.contains(unaActividad.idioma())
	}
}

