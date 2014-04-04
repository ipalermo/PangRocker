package screens;
import gameElements.Score;
import gameElements.ScoreInfo;

import flash.text.TextField;
import gameElements.BackgroundMenu;
import gameElements.GameElement;
import gameElements.Image;
import gameElements.Animation;
import motion.Actuate;
import flash.events.MouseEvent;
import openfl.Assets;
import sound.SoundManager;
import flash.net.SharedObject;

class HighScoresScreen extends Screen {

	private static var _INSTANCE: HighScoresScreen;

	private var b1:Button;
	private var textR:TextField;
	private var textN:TextField;
	private var textS:TextField;
	
	private var textR1:TextField;
	private var textR2:TextField;
	private var textR3:TextField;
	private var textR4:TextField;
	private var textR5:TextField;
	
	private var textN1:TextField;
	private var textN2:TextField;
	private var textN3:TextField;
	private var textN4:TextField;
	private var textN5:TextField;
	
	private var textS1:TextField;
	private var textS2:TextField;
	private var textS3:TextField;
	private var textS4:TextField;
	private var textS5:TextField;
	
	private var highScores:Array<ScoreInfo>; 
	private var newScore1:ScoreInfo;
	private var newScore2:ScoreInfo;
	private var score1:ScoreInfo;
	private var score2:ScoreInfo;
	private var score3:ScoreInfo;
	private var score4:ScoreInfo;
	private var score5:ScoreInfo;
	private var so:SharedObject;
	private var posNewScore1:Int;
	private var posNewScore2:Int;
	
	public function new(sm:ScreenManager) {
		super(sm);		
		so=SharedObject.getLocal('scores1000000');
		if(so!=null && so.data!=null && so.data.score1!=null){
			score1=so.data.score1;
			score2=so.data.score2;
			score3=so.data.score3;
			score4=so.data.score4;
			score5=so.data.score5;
		}else{
			score1=new ScoreInfo(0);
			score2=new ScoreInfo(0);
			score3=new ScoreInfo(0);
			score4=new ScoreInfo(0);
			score5=new ScoreInfo(0);
		}				
		highScores = new Array<ScoreInfo>();
		highScores.push(score1);
		highScores.push(score2);
		highScores.push(score3);
		highScores.push(score4);
		highScores.push(score5);
		newScore1 = new ScoreInfo(0);
		newScore2 = new ScoreInfo(0);
		posNewScore1 = -1;
		posNewScore2 = -2;
		sessionBegin();
				
		var background: GameElement = new BackgroundMenu("images/background_menu.jpg", sm.getHeight()*2);
		addChild(background);
		b1 = new Button(400, 100, 0xFFFFFF, exit, 'Exit');
		textR = new TextField();
		textN = new TextField();
		textS = new TextField();
		
		textR1 = new TextField();
		textR2 = new TextField();
		textR3 = new TextField();
		textR4 = new TextField();
		textR5 = new TextField();
		
		textN1 = new TextField();
		textN2 = new TextField();
		textN3 = new TextField();
		textN4 = new TextField();
		textN5 = new TextField();
		
		textS1 = new TextField();
		textS2 = new TextField();
		textS3 = new TextField();
		textS4 = new TextField();
		textS5 = new TextField();
		drawText((getScreenManager().getWidth()-150)/4, 10, 150, 50, 0xFFFFFF, textR, "Rank");
		drawText((getScreenManager().getWidth()-150)*2/4, 10, 150, 50, 0xFFFFFF, textN, "Name");
		drawText((getScreenManager().getWidth()-150)*3/4, 10, 150, 50, 0xFFFFFF, textS, "Score");
		
		drawText((getScreenManager().getWidth() - 150) / 4, 50, 150, 50, 0xFFFFFF, textR1, "1.");
		drawText((getScreenManager().getWidth() - 150) / 4, 100, 150, 50, 0xFFFFFF, textR2, "2.");
		drawText((getScreenManager().getWidth() - 150) / 4, 150, 150, 50, 0xFFFFFF, textR3, "3.");
		drawText((getScreenManager().getWidth() - 150) / 4, 200, 150, 50, 0xFFFFFF, textR4, "4.");
		drawText((getScreenManager().getWidth() - 150) / 4, 250, 150, 50, 0xFFFFFF, textR5, "5.");
		
		drawText((getScreenManager().getWidth()-150)*2/4, 50, 150, 50, 0xFFFFFF, textN1, score1.getName());
		drawText((getScreenManager().getWidth()-150)*2/4, 100, 150, 50, 0xFFFFFF, textN2, score2.getName());
		drawText((getScreenManager().getWidth()-150)*2/4, 150, 150, 50, 0xFFFFFF, textN3, score3.getName());
		drawText((getScreenManager().getWidth()-150)*2/4, 200, 150, 50, 0xFFFFFF, textN4, score4.getName());
		drawText((getScreenManager().getWidth()-150)*2/4, 250, 150, 50, 0xFFFFFF, textN5, score5.getName());
		
		drawText((getScreenManager().getWidth()-150)*3/4, 50, 150, 50, 0xFFFFFF, textS1, score1.getPoints()+"");
		drawText((getScreenManager().getWidth()-150)*3/4, 100, 150, 50, 0xFFFFFF, textS2, score2.getPoints()+"");
		drawText((getScreenManager().getWidth()-150)*3/4, 150, 150, 50, 0xFFFFFF, textS3, score3.getPoints()+"");
		drawText((getScreenManager().getWidth()-150)*3/4, 200, 150, 50, 0xFFFFFF, textS4, score4.getPoints()+"");
		drawText((getScreenManager().getWidth()-150)*3/4, 250, 150, 50, 0xFFFFFF, textS5, score5.getPoints()+"");

		addChild(b1);
	//	addNewScore(101,102);
		addLogicalChild(background);
	}

	public function exit(evento:MouseEvent) {
		endSession();
		getScreenManager().switchScene('menu');
	}

	override public function init(time: Float) {		
		posNewScore1 = -1;
		posNewScore2 = -2;
		addNewScore(getScreenManager().getScore1(), getScreenManager().getScore2());
		b1.x = 400;
		b1.width = 0;
		b1.height = 0;

		this.alpha = 0;
		b1.y = 300;

		Actuate.tween(this, 0.2, { alpha:1 } );		
		Actuate.tween (b1, 1, { x: (800 - 400) / 2, width:400, height:100 } ).delay(0.15);
	}

	override public function end(onComplete:Dynamic) {
		this.alpha = 1;
		Actuate.tween(this, 1, { alpha:0 } ).onComplete(onComplete);
	}
	
	public function addNewScore(points1 : Int, points2:Int) {
		newScore1 = new ScoreInfo(points1);		
		newScore1.setName("RKR1");
		newScore2 = new ScoreInfo(points2);
		newScore2.setName("RKR2");
		/*trace("h0"+highScores[0]);
		trace("h1"+highScores[1]);
		trace("h2"+highScores[2]);
		trace("h3"+highScores[3]);
		trace("h4" + highScores[4]);*/
		insertarOrdenado(newScore1,posNewScore1);
		insertarOrdenado(newScore2, posNewScore2);
	//	controlarInsert();
		//highScores.sort(comparar);
		/*trace("hn0"+highScores[0]);
		trace("hn1"+highScores[1]);
		trace("hn2"+highScores[2]);
		trace("hn3"+highScores[3]);
		trace("hn4"+highScores[4]);
		trace("hn5"+highScores[5]);*/
		
		score1 = highScores[0];
		textN1.text = score1.getName();
		textS1.text = score1.getPoints()+"";
				
		score2 = highScores[1];
		textN2.text = score2.getName();
		textS2.text = score2.getPoints()+"";
		
		score3 = highScores[2];
		textN3.text = score3.getName();
		textS3.text = score3.getPoints()+"";
		
		score4 = highScores[3];
		textN4.text = score4.getName();
		textS4.text = score4.getPoints()+"";
				
		score5 = highScores[4];
		textN5.text = score5.getName();
		textS5.text = score5.getPoints()+"";
		/*
		score1 = highScores[0];
		text1.text = "1         "+score1.getName()+"        "+score1.getPoints();
		score2 = highScores[1];
		text2.text = "2         "+score2.getName()+"        "+score2.getPoints();
		score3 = highScores[2];
		text3.text = "3         "+score3.getName()+"        "+score3.getPoints();
		score4 = highScores[3];
		text4.text = "4         "+score4.getName()+"        "+score4.getPoints();
		score5 = highScores[4];
		text5.text = "5         "+score5.getName()+"        "+score5.getPoints();*/
	}
	
	public function writeChar(charCode: Int) {
		var tecla: String = String.fromCharCode(charCode);
	}

	private function insertarOrdenado(newScore:ScoreInfo, pos:Int) {
		if (highScores[0].getPoints() < newScore.getPoints()){
			highScores.insert(0, newScore);
			//text1.alpha = 0.5;
			pos = 1;
		}
		else
			if (highScores[1].getPoints() < newScore.getPoints()){
				highScores.insert(1, newScore);
				//text2.alpha = 0.5;
				pos = 2;
			}
			else
				if (highScores[2].getPoints() < newScore.getPoints()){
					highScores.insert(2, newScore);
					//text3.alpha = 0.5;
					pos = 3;
				}
				else
					if (highScores[3].getPoints() < newScore.getPoints()){
						highScores.insert(3, newScore);
						//text4.alpha = 0.5;
						pos = 4;
					}
					else
					if (highScores[4].getPoints() < newScore.getPoints()) {						
						highScores.insert(4, newScore);	
						//text5.alpha = 0.5;
						pos = 5;
					}
	}
	/*
	public function controlarInsert() {
		trace("pos1" + posNewScore1);
		trace("pos2" + posNewScore2);
		if (posNewScore1 == posNewScore2) {
			posNewScore2 = posNewScore2 + 1;			
			if (posNewScore2 == 1)
				text1.alpha = 0.5;
			else
				if (posNewScore2 == 2)
					text2.alpha = 0.5;
				else
					if (posNewScore2 == 3)
						text3.alpha = 0.5;
					else
						if(posNewScore2 == 4)
							text4.alpha = 0.5;
						else
						if (posNewScore2 == 5)
							text4.alpha = 0.5;
		}
	}*/
	
	public function comparar(x : ScoreInfo,y : ScoreInfo) : Int {
		if (x.getPoints() > y.getPoints())
			return 1;
		else
			if (x.getPoints() < y.getPoints())
				return -1;
			else 
				if (x.getPoints() == y.getPoints())
					return 0;
		return 0;
	}
	
	public function sessionBegin(){
		endSession();
		newScore1=new ScoreInfo(0);
		newScore2=new ScoreInfo(0);
	}
	
	public function endSession(){			
		so.data.score1 = this.score1;
		so.data.score2 = this.score2;
		so.data.score3 = this.score3;
		so.data.score4 = this.score4;
		so.data.score5 = this.score5;
		try{
			so.flush();
		}catch(e:Dynamic){
			trace("Error: No se pudo grabar el score!");
		}
	}
	
}