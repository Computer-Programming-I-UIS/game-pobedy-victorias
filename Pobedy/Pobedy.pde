
import ddf.minim.*;


int window = 0, level=1, maxlevel=5, b, ss, plsprite=1, frame, turbinid=1;
int enemy[] ={6, 6};
int defscore []={enemy[0]*enemy[1], enemy[0]*enemy[1]+30};
float autopos[][];
ArrayList<Bullet> bullets;
PImage[] pl, en;
spriteAnim anim;
platforms[] plataformas;
spriteAnim[] turbin;
Minim minim;
AudioPlayer[] s;
boolean[] victory;
mButton[] btn, pbtn, tbtn;
Enemy[][] enm;
callEnemy cen;
PImage menup, about, live, fondo; 
boolean win=false, canpresume=true, gameover=false;
Player player;
void setup() {
  size(800, 600);
  prechargeGraphics(); //Precarga la parte grafica y la interfaz del juego.
  prechargeGameplay(); //Aqui carga la parte funcional como los enemigos y el jugador.
  prechargeSounds();
  surface.setTitle("Pobedy - Victory or dead");
  for (int i=0; i<2; i++) {
  }
}

void draw() {
  textSize(15);
  loadGraphics();
}
