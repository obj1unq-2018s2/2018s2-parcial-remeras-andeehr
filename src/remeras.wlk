class Remera {

	const talle
	const color
	const costoFijo32a40 = 80
	const costoFijo41a48 = 100
	const coloresBasicos = [ "Negro", "Gris", "Blanco" ]

	method costo() {
		if (talle.between(32, 40) && coloresBasicos.contains(color)) {
			return costoFijo32a40
		} else if (talle.between(32, 40) && !coloresBasicos.contains(color)) {
			return costoFijo32a40 * 1.10
		} else if (talle.between(41, 48) && coloresBasicos.contains(color)) {
			return costoFijo41a48
		} else {
			return costoFijo41a48 * 1.1
		}
	}

	method descuento() = 10

}

class RemeraBordada inherits Remera {

	const cantColores

	override method costo() = super() + self.costoBordado()

	method costoBordado() = (cantColores * 10).max(20)

	override method descuento() = 2

}

class RemeraSublimada inherits Remera {

	const anchoDibujo = 10
	const altoDibujo = 15
	const costoSublimadoCM2 = 0.50
	
	// TODO Deberías modelar la marca comercial, que podría resumir los tres atributos que siguen.
	const dibujoEsPropiedadPrivada = true
	const tieneConvenioPublicidad = true
	const costoDibujo = 100

	override method costo() = super() + self.costoSublimado() + self.costoDibujo()

	method costoSublimado() = anchoDibujo * altoDibujo * costoSublimadoCM2

	method costoDibujo() {
		if (dibujoEsPropiedadPrivada) {
			return costoDibujo
		} else {
			return 0
		}
	}

	override method descuento() {
		if (tieneConvenioPublicidad) {
			return 20
		} else {
			return super()
		}
	}

}

