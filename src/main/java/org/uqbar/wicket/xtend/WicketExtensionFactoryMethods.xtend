package org.uqbar.wicket.xtend

import java.io.Serializable
import org.apache.wicket.Component
import org.apache.wicket.MarkupContainer
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.panel.FeedbackPanel
import org.apache.wicket.model.CompoundPropertyModel
import org.eclipse.jdt.annotation.Nullable
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1

/**
 * Wicket extension methods to make it easy to use in xtend.
 * Also using all the power that comes with xtend like extension methods, closures, etc.
 */
class WicketExtensionFactoryMethods implements Serializable {
	
	def <M> asCompoundModel(M aModelObject) {
		new CompoundPropertyModel<M>(aModelObject)
	}
	
	def addChild(MarkupContainer container, Component child) {
		container.add(child)
	}
	
	def label(MarkupContainer container, String id) {
		label(container, id, [])
	}
	
	def label(MarkupContainer container, String id, @Nullable Procedure1<Label> p) {
		addLabel(container, id, p)
	}
	
	def feedbackPanel(MarkupContainer container, String id) {
		feedbackPanel(container, id, [])
	}
	
	def feedbackPanel(MarkupContainer container, String id, @Nullable Procedure1<FeedbackPanel> p) {
		addIt(container, new FeedbackPanel(id), p)
	}
	
	def button(MarkupContainer container, String id, @Nullable Procedure1<XButton> p) {
		addIt(container, new XButton(id), p)
	}
	
	def addLabel(MarkupContainer container, String id, @Nullable Procedure1<Label> p) {
		addIt(container, new Label(id), p)
	}
	
	def <M> form(MarkupContainer container, String id, @Nullable Procedure1<Form<M>> p) {
		addIt(container, new Form(id), p)
	}
	
	def <T> textField(MarkupContainer container, String id) {
		textField(container, id, [])
	}
	
	def <T> textField(MarkupContainer container, String id, @Nullable Procedure1<TextField<T>> p) {
		addTextField(container, id, p)
	}
	
	def <T> addTextField(MarkupContainer container, String id, @Nullable Procedure1<TextField<T>> p) {
		addIt(container, new TextField(id), p)
	}
	
	def <C extends Component> addIt(MarkupContainer container, C component, @Nullable Procedure1<C> p) {
		container.add(component)
		if (p != null) {
			p.apply(component)
		}
		component
	}
	
}