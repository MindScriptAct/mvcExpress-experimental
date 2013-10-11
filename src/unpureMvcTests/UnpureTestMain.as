package unpureMvcTests {
import flash.display.Sprite;

public class UnpureTestMain extends Sprite {

	private var facade:UnpureTestFacade;

	public function UnpureTestMain() {

		facade = new UnpureTestFacade();
		facade.startup(this);

	}
}
}
