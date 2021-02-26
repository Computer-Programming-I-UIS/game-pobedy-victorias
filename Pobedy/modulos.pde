void prechargeGraphics() {
  pl = new PImage[3];
  en = new PImage[3];
  turbin = new spriteAnim[10];
  menup = loadImage("data/menup.png");
  fondo = loadImage("data/sound/fondo.jpg");
  about = loadImage("data/about.png");
  live = loadImage("data/gameplay/live.png");
  pl[0] = loadImage("data/gameplay/pl1.png"); 
  pl[1] = loadImage("data/gameplay/pl2.png");
  pl[2] = loadImage("data/gameplay/pl3.png");
  en[0] = loadImage("data/gameplay/enemy1.png");
  en[1] = loadImage("data/gameplay/enemy2.png");
  en[2] = loadImage("data/gameplay/enemy3.png");
  anim = new spriteAnim("data/gameplay/boom/boom", 12);
  turbin[0] = new spriteAnim("data/gameplay/turbin1/turbin", 11);
  turbin[1] = new spriteAnim("data/gameplay/turbin2/turbin", 15);
  prechargeButtons();
}
void prechargeButtons() {
  btn = new mButton[7];
  pbtn = new mButton[3];
  tbtn = new mButton[2];
  for (int i=0; i<pbtn.length; i++) {
    pbtn[i]=new mButton(i, true, false);
  }
  for (int i = 0; i<tbtn.length; i++) {
    tbtn[i]=new mButton(i, false, true);
  }
  for (int i=0; i<btn.length; i++) {
    btn[i] = new mButton(i, false, false);
  }
}
void prechargeGameplay() {
  player = new Player();

  victory = new boolean[maxlevel];
  autopos = new float[20][2];
  enm = new Enemy[enemy[0]][enemy[1]];
  en2 = new Enemy[enemy[1]][enemy[0]];
  en3 = new Enemy[enemy[0]][enemy[1]];
  bullets = new ArrayList<Bullet>(); 
    

  for (int i=0; i<maxlevel; i++) {
    victory[i]=false;
  }
  createEnemies();
}
void createEnemies() {
  for (int i=0; i<enemy[0]; i++) {
    for (int j=0; j<enemy[1]; j++) {
      enm[i][j] = new Enemy(50*(1+i), 50*(1+j)); 
      enm[i][j].alive = true;
      en2[i][j] = new Enemy(50*(1+i), 50*(1+j)); 
      en2[i][j].alive = true;
      en3[i][j] = new Enemy(50*(1+i), 50*(1+j)); 
      en3[i][j].alive = true;
    }
  } 
  cen = new callEnemy(0.051, enm, 1);
  ce2 = new callEnemy(0.061, en2, 2);
  ce3 = new callEnemy(0.071, en3, 3);
}
void prechargeSounds() {
  minim = new Minim(this);
  s=new AudioPlayer[20];
  s[0] = minim.loadFile("data/sound/explode.wav");
  s[1] = minim.loadFile("data/sound/shoot.wav");
  s[6] = minim.loadFile("data/sound/select1.mp3");
  s[7] = minim.loadFile("data/sound/select2.mp3");
  s[10] = minim.loadFile("data/sound/menu.mp3");
}
