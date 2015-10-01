package org.uqbar.examples.calculadora.wicket.xtend.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.panel.FeedbackPanel
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.examples.calculadora.wicket.xtend.domain.CalculadoraDivision
import org.uqbar.wicket.xtend.PropertyValidator
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XForm

/**
 * @author jfernandes
 */
class CalculadoraDivisionPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	new() {
		val form = new XForm<CalculadoraDivision>("calculadoraForm", new CompoundPropertyModel(new CalculadoraDivision))
		this.addChild(form)
		this.addFields(form)
		this.addActions(form)
	}

	def void addFields(Form<CalculadoraDivision> form) {
		form => [
			addChild(crearDividendoTextField(form))
			addChild(crearDivisorTextField(form))
			addChild(new Label("resultado"))
			addChild(new FeedbackPanel("feedbackPanel"))
		]
	}

	// dividendo
	def crearDividendoTextField(Form<CalculadoraDivision> form) {
		new TextField<Double>("dividendo") => [
			add(
				[ validatable |
					form.modelObject.validarDividendo(validatable.value) // agregamos un validador específico
				])
		]
	}

	def crearDivisorTextField(Form<CalculadoraDivision> form) {
		new TextField<Double>("divisor") => [
			add(new PropertyValidator) // validator generico, llama a un método del dominio validarXXXX()
		]
	}

	def void addActions(Form<CalculadoraDivision> form) {
		form.addChild(
			new XButton("dividir") => [
				onClick = [|form.modelObject.dividir]
			]
		)
	}

}
