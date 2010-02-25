package programmaticSkinClasses {
	
	import mx.core.UIComponent;
	import flash.filters.DropShadowFilter;

	public class GradientRectangleSkin extends UIComponent	{
		
			import flash.display.Graphics;
			import flash.geom.Rectangle;
			import mx.graphics.GradientEntry;
			import mx.graphics.LinearGradient;
			  
			protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			   super.updateDisplayList(unscaledWidth,unscaledHeight);
				var w:Number = unscaledWidth;
				var h:Number = unscaledHeight;
				
				// hold the values of the gradients depending on button state
				var backgroundFillColor:Number;
				var backgroundFillColor2:Number;
				var backgroundFillColor3:Number;
				
				
				var fill:LinearGradient = new LinearGradient();
				
				// reference the graphics object of this skin class
				var g:Graphics = graphics;
				g.clear();				
				
				//	which skin is the button currently looking for? Which skin to use?
				switch (name) {
					case "upSkin":
						backgroundFillColor = 0xFFFFFF;
						backgroundFillColor2 = 0x929292;
						break;
					case "overSkin":
						backgroundFillColor = 0xFFFFFF;
						backgroundFillColor2 = 0x990000;
						break;
					case "downSkin":
						backgroundFillColor = 0x888888;
						backgroundFillColor2 = 0x777777;
						color: 0xFF0000;
						break;
					case "disabledSkin":
						backgroundFillColor = 0xCCCCCC;
						backgroundFillColor2 = 0xCCCCCC;
						break;
				}				
				// depending on which state the button's in, we set our color for the 
				// gradients on the skin
				var g1:GradientEntry = new GradientEntry(backgroundFillColor,.10,100);
				var g2:GradientEntry = new GradientEntry(backgroundFillColor2,.60,100);
				  
				fill.entries = [g1,g2];
				fill.angle = 90;
				// fill the rectangle
				g.moveTo(0,0);
				fill.begin(g,new Rectangle(0,0,w,h));
				g.lineTo(w,0);
				g.lineTo(w,h);
				g.lineTo(0,h);
				g.lineTo(0,0);  
				fill.end(g);
				// if we're not showing the down skin, show the shadow. Otherwise hide it on the "down state" to look like it's being pressed
				if(name != "downSkin") {	            
		            filters = [new DropShadowFilter(4, 45,0x000000,.2)];
				}
			 }
	}
}