import Socio.*
import libro.*
class ViajeDePlaya{
	const idioma = []
	var property largoDePlaya = 4
	method idioma(){return idioma}
	method largoDePlaya(){
		return largoDePlaya
	}
	method diasDeViaje(){
		return largoDePlaya/500
	}
	method implicaEsfuerzo(){
		return largoDePlaya > 1200
	}
	method broncearse(){
		return true
	}
	method esInteresante(){
		return idioma.size() >1
	}
	method actividadRecomendadaParaSocio(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) and
		 not unSocio.actividadrealizada(self) == self
	}
}

class ExcursionCiudad{
	const idioma = []
	var property atracciones
	method idioma(){return idioma}
	method diasDeViaje(){
		return atracciones/2
	}
	method implicaEsfuerzo(){
		return atracciones.between(5,8)
	}
	method broncearse(){
		return false
	}
	method esInteresante(){
		return idioma.size() > 1 or atracciones == 5
	}
	method actividadRecomendadaParaSocio(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) and
		 not unSocio.actividadrealizada(self) == self
	}
}

class ExcursionesCiudadTropical inherits ExcursionCiudad{
	override method diasDeViaje(){
		return super() + 1
	}
	override method broncearse(){
		return true
	}
}

class SalidaTrenkking{
	const idioma = []
	var property kmSendero
	var property diasDeSolPorAnio
	method idioma(){return idioma}
	method diasDeViaje(){
		return kmSendero /50
	}
	method implicaEsfuerzo(){
		return kmSendero > 80
	}
	method broncearse(){
		return diasDeSolPorAnio > 200 
			or diasDeSolPorAnio.between(100,200) 
			and kmSendero > 120 
	}
	method esInteresante(){
		return idioma.size() > 1 and diasDeSolPorAnio > 140
	}
	method actividadRecomendadaParaSocio(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) and
		 not unSocio.actividadrealizada(self) == self
	}
}

class ClaseGimnasia{
	const idioma = "Español"
	method diasDeViaje(){
		return 1
	}
	method idioma(){return idioma}
	method implicaEsfuerzo(){
		return true
	}
	method broncearse(){
		return false
	}
	method esInteresante(){
		return idioma.size() >1
	}
	method actividadRecomendadaParaSocio(unSocio){
		return unSocio.edad().between(20,30)
	}
}

class TallerLiterario{
	const librosTrabajados= []
	
	method librosTrabajados(){return librosTrabajados}
	method idiomasUsados(){
		return librosTrabajados.map({l=>l.idioma()})
	}
	method diasDeViaje(){
		return librosTrabajados.size() + 1
	}
	method implicaEsfuerzo(){
		return librosTrabajados.any({l=>l.cantPaginas()>500})
		or librosTrabajados.all({l=>l.nombreAutor() == l.nombreAutor()})
		and librosTrabajados.size()>1		
	}
	method broncearse(){
		return false
	}
	method actividadRecomendadaParaSocio(unSocio){
		return unSocio.idiomas().size() > 1
	}
}
