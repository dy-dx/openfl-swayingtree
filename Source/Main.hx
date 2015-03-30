package;


import openfl.display.Sprite;
import openfl.events.Event;

class Main extends Sprite
{
  private var tree : Tree;
  public var time : Int;

	public function new () {
		super ();

		tree = new Tree(7, 80.0, 20.0);
    tree.x = 400;
    tree.y = 400;
    tree.rotation = -90;

		addChild(tree);


    // Render loop
    this.addEventListener(Event.ENTER_FRAME, renderLoop);
	}

  private function renderLoop(e:Event):Void
  {
    time = Math.floor(Date.now().getTime());
    tree.update(time);
  }


}
