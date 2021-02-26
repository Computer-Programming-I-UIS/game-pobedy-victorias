void loadGamePlay() {
  levelLoad();
  loadGameDecorators();
  disableNoGameSounds();
}
void gamePaused() {
  btn[4].backplace(600, 200, 4, "Menú");
  if (victory[level] && level<maxlevel) {
    callvictory();
  } else if (!victory[level] && !gameover) {
    btn[5].backplace(600, 400, 6, "Jugar");
  } else if (gameover) {
    fill(#FFFFFF);
    rect(250, 250, 150, 30);
    fill(0);
    text("Elegiste la muerte!", 280, 270);
  }
}
void disableNoGameSounds() {
  if (s[10].isPlaying()) {
    s[10].pause();
  }
}
void gamestart() {
  window=1;
  createEnemies();
  player.score = 0;
  player.lives =3;
  level = 1;
  bullets.clear();
  player.alive=true;
  player.pos2d.x=375;
  player.pos2d.y=500;
  for (int i=0; i<maxlevel; i++) {
    victory[i] = false;
  }
}
void mapdraw() {
  if (level==1) {
    fill(#FFFFFF, 10);
    rect(20, 400, 480, 20, 20, 20, 20, 20);
    if (player.alive) {
      for (int i=1; i<20; i++) {
        fill(#FFFFFF);
        autopos[i][0]=random(20, 500);
        autopos[i][1]=random(20, 580);
        noStroke();
        estrellita(autopos[i][0], autopos[i][1], 2, 2, 5);
      }
    } else {
      for (int i=0; i<20; i++) {
        fill(#FFFFFF);
        noStroke();
        pushMatrix();
        estrellita(autopos[i][0], autopos[i][1], 2, 2, 5);
        popMatrix();
      }
    }
  } else if (level==2) {
  }
}

void estrellita(float x, float y, float r1, float r2, int puntos) {
  float angulo = TWO_PI / puntos;
  float mitad = angulo/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angulo) {
    float sx = x + cos(a) * r2;
    float sy = y + sin(a) * r2;
    vertex(sx, sy);
    sx = x + cos(a+mitad) * r1;
    sy = y + sin(a+mitad) * r1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void mapborders() {
  fill(0);
  rect(0, 0, 20, 600);
  rect(780, 0, 20, 600);
  
  rect(0, 580, 800, 20);
  if (window==4) {
    rect(500, 0, 800, 20);
  } else {
    rect(0, 0, 800, 20);
  }
  rect(500, 0, 20, 600);
}
void loadGameDecorators() {
  fill(#54FF52);
  rect(500, 0, 280, 600, 20, 20, 20, 20);
  mapborders();

  for (int i=0; i<player.lives; i++) {
    image(live, 600+30*i, 35, 25, 25);
  }
  fill(#FFFFFF);
  text("Vidas:", 550, 50);
  text("Puntaje:   "+player.score, 550, 100);
  text("Nivel:   "+level, 550, 150);
  btn[5].backplace(600, 400, 5, "Pausar");
  btn[4].backplace(600, 200, 4, "Menú");
}
void callvictory() {
  if (level==1) {
    background(#102074);
    loadGameDecorators();
    player.play();
    player.update();
    if (player.pos2d.x!=240) {
      if (player.pos2d.x<240) {
        player.pos2d.x+=1;
      } else if (player.pos2d.x>240) {
        player.pos2d.x-=1;
      }
    } else if (player.pos2d.x==240 && player.pos2d.y>-100) {
      player.pos2d.y-=2;
    } else if (player.pos2d.y<0) {
      fill(#FFFFFF);
      rect(250, 250, 150, 30);
      fill(0);
      text("Victoria!", 300, 270);
      btn[5].backplace(320, 400, 999, "Siguiente Nivel");
    }
  }
}
