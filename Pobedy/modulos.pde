void prechargeGraphics(){
 pl = new PImage[3];
 en = new PImage[2];
 menup = loadImage("data/menup.png");
 about = loadImage("data/about.png");
 live = loadImage("data/gameplay/live.png");
 pl[0] = loadImage("data/gameplay/pl1.png"); 
 pl[1] = loadImage("data/gameplay/pl2.png");
 en[0] = loadImage("data/gameplay/enemy1.png");
 en[1] = loadImage("data/gameplay/enemy2.png");
 anim = new spriteAnim("data/gameplay/boom/boom", 12);
 prechargeButtons();
  
}
void prechargeButtons(){
  btn = new mButton[7];
  pbtn = new mButton[2];
  for(int i=0;i<pbtn.length;i++){
    pbtn[i]=new mButton(i,true);
  }
  for(int i=0;i<btn.length;i++){
   btn[i] = new mButton(i,false);
  }
  
}
void prechargeGameplay(){
 player = new Player();
 cen = new callEnemy();
 enm = new Enemy[enemy[0]][enemy[1]];
 bullets = new ArrayList<Bullet>(); 
 for(int i=0;i<enemy[0];i++){
      for(int j=0;j<enemy[1];j++){
         enm[i][j] = new Enemy(50*(1+i),50*(1+j)); 
      }
 }
}
void prechargeSounds(){
 minim = new Minim(this);
 s=new AudioPlayer[20];
 s[0] = minim.loadFile("data/sound/explode.wav");
 s[1] = minim.loadFile("data/sound/shoot.wav");
 s[6] = minim.loadFile("data/sound/select1.mp3");
 s[7] = minim.loadFile("data/sound/select2.mp3");
 s[10] = minim.loadFile("data/sound/menu.mp3"); 
  
}
