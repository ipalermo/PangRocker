package gameElements;

import input.InputConfiguration;
import flash.display.Bitmap;
import flash.geom.Point;
import openfl.Assets;

class Disparo extends Personaje {

	private var _imagenDisparo:Animation;

	public function new(alto: Float) {
		super(0);
		_imagenDisparo = new Animation( Assets.getBitmapData("images/shoot_1.png"), 6, 1);
		addLogicalChild(_imagenDisparo);
		addChild(_imagenDisparo);
		//TODO esta escala hardcodeada
		_imagenDisparo.scaleY = 2;
		this.boundingBox = new Point(_imagenDisparo.getWidth(), _imagenDisparo.height);
	}

	public function setPosition(x: Float, y:Float) {
		this.x = x;
		this.y = y;
	}
		
}