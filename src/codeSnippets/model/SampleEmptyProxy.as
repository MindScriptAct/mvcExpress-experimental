package codeSnippets.model {
import mvcexpress.mvc.Proxy;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class SampleEmptyProxy extends Proxy implements ISampleEmptyProxy {

	private var description:String;

	public function SampleEmptyProxy(description:String) {
		this.description = description;
	}

	public function getDescription():String {
		return description;
	}

}
}