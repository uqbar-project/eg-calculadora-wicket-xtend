package org.uqbar.examples.calculadora.wicket.xtend.wicket

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.panel.FeedbackPanel
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.examples.calculadora.wicket.xtend.domain.CalculadoraDivision
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

/**
 * @author jfernandes
 */
class CalculadoraDivisionPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	new() {
		defaultModel = new CompoundPropertyModel(new CalculadoraDivision())
		val form = new Form<CalculadoraDivision>("calculadoraForm");
		this.addChild(form)
		
		this.addFields(form)
		this.addActions(form)
	}
	
	def addFields(Form<CalculadoraDivision> form) {
		form.addChild(new TextField<Double>("dividendo"))
		form.addChild(new TextField<Double>("divisor"))
		form.addChild(new Label("resultado"))
		form.addChild(new FeedbackPanel("feedbackPanel"))
	}
	
	def addActions(Form<CalculadoraDivision> form) {
		val button = new XButton("dividir")
		button.onClick = [| calculadora.dividir ]
		form.addChild(button)
	}
	
	def getCalculadora() {
		this.getDefaultModelObject() as CalculadoraDivision;
	}

}