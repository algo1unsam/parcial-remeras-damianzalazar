import comercio.*

class RemeraLisa {

	const talle = 32
	const color = negro

	method costo() = self.costoTalle() + self.costoColor()

	method costoTalle() {
		if (talle.between(32, 40)) return 80
		if (talle.between(41, 48)) return 100
		return error.throwWithMessage("Elija un talle correcto")
	}

	method costoColor() {
		if (color != blanco && color != negro && color != gris) return self.costoTalle() * 0.1 else return 0
	}

	method descripcion() {
		return "remeraLisa"
	}

	method descuento() = 0.9

}

class RemeraBordada inherits RemeraLisa {

	var colores = []
	var valorXcolor = 10

	method agregar(color) = colores.add(color)

	override method costo() {
		return self.costoBordado() + super()
	}

	method costoBordado() {
		return self.cantColores() * valorXcolor
	}

	method cantColores() {
		self.validaCantidad()
		return colores.size()
	}

	method validaCantidad() {
		if (colores.size() < 2) valorXcolor = 20
	}

	override method descripcion() {
		return "remeraBordada"
	}

	override method descuento() = 1

}

class RemeraSublimada inherits RemeraLisa {

	const alto = 5
	const ancho = 5
	const valorXcentimetroCuadrado = 0.5
	var dibujo = comun

	method superficie() {
		return alto * ancho
	}

	override method costo() {
		return super() + self.costoSublimado() + self.costoDerechosAutor()
	}

	method costoSublimado() = self.superficie() * valorXcentimetroCuadrado

	method costoDerechosAutor() {
		return dibujo.costo()
	}

	override method descripcion() {
		return "remeraBordada"
	}

	override method descuento() {
		if(self.validaSiDibujoEsDeUnaMarcaConvenio()) return 0.8 else return 1
	}
	
	method validaSiDibujoEsDeUnaMarcaConvenio(){
		return comercio.validaSiDibujoEsDeUnaMarcaEnConvenio(dibujo)
	}

}

class MarcaComercial {

	var property costo = 100

}

object comun {

	var property costo = 0

}

object negro {

}

object gris {

}

object blanco {

}

