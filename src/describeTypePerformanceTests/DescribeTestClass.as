package describeTypePerformanceTests {
import flash.display.Sprite;

public class DescribeTestClass {


	[Inject]
	private var privateInject:Sprite;

	[Inject]
	public var pubInject:Sprite;

	private var _getInject:Sprite;

	[Inject]
	public function set getInject(value:Sprite):void {
		_getInject = value;
	}

	[Inject(name='test')]
	private var privateInjectNamed:Sprite;

	[Inject(name='test')]
	public var pubInjectNamed:Sprite;

	[Inject(name='test')]
	public function set getInjectNamed(value:Sprite):void {
		_getInject = value;
	}


}
}
