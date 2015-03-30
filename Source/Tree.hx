package;

import openfl.display.Sprite;

class Tree extends Sprite {

  var left : Tree;
  var right : Tree;
  var theta : Float;

  public function new (height:Int, bLength:Float, bWidth:Float, theta:Float=28)
  {
    super ();

    if (height == 0)
    {
      return;
    }

    this.theta = theta;

    graphics.beginFill(0x000000, 1.0);
    graphics.drawRect(0, -bWidth/2, bLength, bWidth);
    graphics.endFill();

    var nextBLength = bLength * 0.8;
    var nextBWidth = bWidth * 0.70;
    var nextTheta = theta * 0.86;

    left = new Tree(height-1, nextBLength, nextBWidth, nextTheta);
    right = new Tree(height-1, nextBLength, nextBWidth, nextTheta);

    // left.rotation = theta;
    // right.rotation = -theta;
    left.x = right.x = bLength - bWidth/2;

    addChild(left);
    addChild(right);

  }

  public function update (time:Int):Void
  {
    if (left == null || right == null)
    {
      return;
    }

    var wind = 0.2 * Math.sin(time/1000) * (180/Math.PI);

    left.rotation = theta + wind;
    right.rotation = -theta + wind;

    left.update(time);
    right.update(time);
  }

}
