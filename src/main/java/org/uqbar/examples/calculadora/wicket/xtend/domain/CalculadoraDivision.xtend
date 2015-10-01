package org.uqbar.examples.calculadora.wicket.xtend.domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException

/**
 * Calculadora de division (permite tener más validaciones que la de suma/resta)
 * 
 * @author jfernandes
 */
@Accessors
class CalculadoraDivision implements Serializable {
	double dividendo
	double divisor
	double resultado
	
	def void dividir() {
		validarDivisor(this.divisor)
		this.resultado = this.dividendo / this.divisor
	}

	def void validarDivisor(Double unDivisor) {
		if (unDivisor == 0) {
			throw new UserException("No se puede dividir por cero!")
		}
	}

	def void setDividendo(double dividendo) {
		this.validarDividendo(dividendo)
		this.dividendo = dividendo
	}

	def void validarDividendo(Double dividendo) {
		if (dividendo == -1) {
			throw new UserException("No se puede usar el -1!")
		}
	}

	def void setDivisor(double divisor) {
		validarDivisor(divisor)
		this.divisor = divisor
	}
	
}