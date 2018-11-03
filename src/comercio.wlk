import remeras.*

object comercio {

	var pedidos = []
	var property marcasEnConvenio = []

	method agregarPedido(pedido) = pedidos.add(pedido)
	method agregarMarcaAConvenio(marca) = marcasEnConvenio.add(marca)
	
	method validaSiDibujoEsDeUnaMarcaEnConvenio(dibujo){
		return marcasEnConvenio.any{marca => marca == dibujo}
	}

}

class Sucursal {
	var property cantMinRemeras = 2
}

class Pedido {

	var remeras = []
	const sucursal

	method agregar(remera_s) {
		remeras.addAll(remera_s)
	}

	method precio() {
		return self.cantRemeras() * self.costoRemera()
	}

	method cantRemeras() = remeras.size()
	
	method costoRemera(){
		return self.tipoRemera().costo() * self.descuento()
	}
	
	method descuento(){
		if(self.descuentoXcant()) {
			return self.descuentoXremera()
		}
		else return 1
	}
	
	method descuentoXcant(){
		return self.cantRemeras() >= sucursal.cantMinRemeras()
	}
	
	method descuentoXremera(){
		return self.tipoRemera().descuento()
	}
	
	method tipoRemera(){
		return remeras.first()
	}
}

