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

	method registrarPedido(pedido) {
		pedidosRealizados.add(pedido)
	}

	method totalFacturado() = pedidosRealizados.sum{ pedido => pedido.precio() }

	method pedidoMasCaro() = pedidosRealizados.max{ pedido => pedido.precio() }

	method vendioTodosLosTalles() = true // hacer

}

class Comercio {

	const sucursales = []

	method pedidosTotales() = sucursales.map{ sucursal => sucursal.pedidosRealizados() }.flatten()

	method totalFacturado() = self.pedidosTotales().sum{ pedido => pedido.precio() }

	method pedidoMasCaro() = self.pedidosTotales().max{ pedido => pedido.precio() }

	method cantRemerasDe(color) = self.pedidosTotales().count{ pedido => pedido.remera().color() == color }

	method sucursalQueMasFacturo() = sucursales.max{ sucursal => sucursal.totalFacturado() }

	method sucursalesQueVendieronTodosLosTalles() = sucursales.filter{ sucursal => sucursal.vendioTodosLosTalles() }

}

