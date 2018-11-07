class Pedido {

	const remera
	const cantidad
	const sucursal

	method precioBase() = remera.costo() * cantidad

	method precio() {
		if (self.aplicaDescuento()) {
			return self.precioBase() - self.descuento()
		} else {
			return self.precioBase()
		}
	}

	method descuento() = self.precioBase() * (self.porcentajeDescuento() / 100)

	method porcentajeDescuento() = remera.descuento()

	method aplicaDescuento() = cantidad >= sucursal.minimoRemerasParaDescuento()

}

class Sucursal {

	const property minimoRemerasParaDescuento
	const property pedidosRealizados = []

	method registrarPedido(modelo, cuantas) {
		pedidosRealizados.add(new Pedido(remera = modelo, cantidad = cuantas, sucursal = self))
	}

	method totalFacturado() = pedidosRealizados.sum{ pedido => pedido.precio() }

	method pedidoMasCaro() = pedidosRealizados.max{ pedido => pedido.precio() }

	method vendioTodosLosTalles() {
		// No llegue a hacerlo	
		return true
	}

}

class Comercio {

	const sucursales = []

	method pedidosTotales() = sucursales.map{ sucursal => sucursal.pedidosRealizados() }.flatten()

	method totalFacturado() = self.pedidosTotales().sum{ pedido => pedido.precio() }

	method totalFacturadoEn(sucursal) = sucursal.totalFacturado()

	method pedidoMasCaro() = self.pedidosTotales().max{ pedido => pedido.precio() }

	method cantRemerasDe(color) = self.pedidosTotales().count{ pedido => pedido.remera().color() == color }

	method sucursalQueMasFacturo() = sucursales.max{ sucursal => sucursal.totalFacturado() }

	method sucursalesQueVendieronTodosLosTalles() = sucursales.filter{ sucursal => sucursal.vendioTodosLosTalles() }

	method tallesQueNoPidieron() = new Range(32, 48).difference(self.tallesQuePidieron())

	method tallesQuePidieron() {
		return [ 40, 41 ]
	// No llegue, deberia devolver una coleccion con todos los talles que pidieron
	}

}

