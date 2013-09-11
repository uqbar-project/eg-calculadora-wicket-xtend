package org.uqbar.wicket.xtend

import org.apache.wicket.markup.html.form.Button
import org.eclipse.xtext.xbase.lib.Procedures.Procedure0

/**
 * xtend friendly wicket button.
 * Allows you to use procedure's as onclick listeners.
 */
class XButton extends Button {
	Procedure0 procedure
	new(String id) {
		super(id)
	}
	
	override onSubmit() {
		procedure.apply
	}
	
	def setOnClick(Procedure0 procedure) {
		this.procedure = procedure
	}
	
}