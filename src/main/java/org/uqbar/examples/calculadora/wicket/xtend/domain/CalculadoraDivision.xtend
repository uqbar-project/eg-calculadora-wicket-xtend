package org.uqbar.examples.calculadora.wicket.xtend.domain

import java.io.Serializable
import org.uqbar.commons.model.UserException

/**
 * Calculadora de division (permite tener más validaciones que la de suma/resta)
 * 
 * @author jfernandes
 */
class CalculadoraDivision implements Serializable {
	@Property double dividendo
	@Property double divisor
	@Property double resultado
	
	def void dividir() {
		validarDivisor(this.divisor);
		this.resultado = this.dividendo / this.divisor;
	}

	def void validarDivisor(Double unDivisor) {
		if (unDivisor == 0) {
			throw new UserException("No se puede dividir por cero!");
		}
	}

	def void setDividendo(double dividendo) {
		if (dividendo == -1) {
			throw new UserException("No se puede user el -1!");
		}
		this._dividendo = dividendo;
	}

	def void setDivisor(double divisor) {
		validarDivisor(divisor);
		this._divisor = divisor;
	}
	
}