package codeSnippetsFlex.controller.params {

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class ComplexParamsFlex {
	public var description:String;

	public function ComplexParamsFlex(description:String = "") {
		this.description = description;
	}

	public function toString():String {
		return "[ComplexParams description=" + description + "]";
	}
}
}