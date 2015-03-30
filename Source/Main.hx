package;


import openfl.display.Sprite;
import openfl.events.Event;
import noisehx.Perlin;

class Main extends Sprite
{
  private var tree : Tree;
  public var time : Float;
  public var perlin : Perlin;

	public function new () {
		super ();

    perlin = new Perlin();

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
    time = Date.now().getTime();
    tree.update(time, perlin);
  }


}
