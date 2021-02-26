class Enemy {
  PVector pos;
  int size = 30;
  int w=0;
  int enemysprite = round(random(0, 2));
  boolean alive = true, showdeath=true;
  Enemy(int px, int py) {
    pos = new PVector(px, py);
  }
  void place() {

    if (alive) {
      image(en[enemysprite], pos.x, pos.y, size, size);
    } else {
      if (showdeath) {
        anim.display(pos.x, pos.y);

        w=w+1;
        if (w==30) {
          showdeath=false;
        }
      }
    }
  }
  void shoot(float sr, float x, float y) {
    if (random(0, 1) < sr ) {
      print("a");
      bullets.add(new Bullet(x, y, false));
    }
  }

  void update() {
    for (b = bullets.size()-1; b >= 0; b--) {
    }
  }
}
class callEnemy {
  int entspeed = 2, bajas=0;
  PVector pos;
  Enemy[][] ent;
  int debut;
  float pr, prshoot=0.031;
  callEnemy(float dif, Enemy[][] enz, int apar) {
    pos = new PVector(0, 0);
    prshoot=dif;
    ent = enz;
    debut = apar;
  }
  void reset() {
    for (int i=0; i<enemy[0]; i++) {
      for (int j=0; j<enemy[1]; j++) {
        ent[i][j].pos.x = 50*(1+i); 
        ent[i][j].pos.y = 50*(1+j);
      }
    }
    pos.x=0;
    pos.y=0;
    bullets.clear();
  }
  void EnemyPlace() {
    for (int i = 0; i < ent.length; i++) {
      for (int j = 0; j < ent[i].length; j++) {

        ent[i][j].place();
      }
    }
  }
  void update() {
    boolean borde = false;
    pr = prshoot/(enemy[0]*enemy[1]-bajas*level);

    if (player.lives<=0) {
      window=4; // Game Over
      gameover=true;
    }
    if (player.score==defscore[level-1]) {
      window=4;
      victory[level-1]=true;
    }
    for (int i = 0; i < ent.length; i++) {
      for (int j = 0; j < ent[i].length; j++) {
        if (ent[i][j].alive && player.alive) {
          ent[i][j].pos.x += entspeed*level;
        }
        if (ent[i][j].pos.y + ent[i][j].size > height - player.size*2 && player.alive && ent[i][j].alive || ent[i][j].pos.y +ent[i][j].size == player.pos2d.y && ent[i][j].alive && player.alive) { 
          player.alive=false;
        }


        if ((ent[i][j].pos.x + ent[i][j].size > width-300 && !borde || ent[i][j].pos.x - ent[i][j].size < 0 && !borde)) {
          borde = true;
        } else if (ent[i][j].pos.x + ent[i][j].size > width-299) {
          ent[i][j].pos.x+=-3;
        }
      }
    }
    if (borde) {
      for (int i = 0; i < ent.length; i++) {
        for (int j = 0; j < ent[i].length; j++) {
          ent[i][j].pos.y += ent[i][j].size;
        }
      }
      entspeed *= -1;
      pos.y += 15;
      borde=false;
    }
    for (int i=0; i<ent.length; i++) {
      for (int j=0; j<ent[i].length; j++) {
        for (b = bullets.size()-1; b >= 0; b--) {
          Bullet bullet = bullets.get(b);
          if (bullet.tp &&bullet.pos.y > ent[i][j].pos.y && bullet.pos.y<ent[i][j].pos.y+15 && bullet.pos.x >ent[i][j].pos.x && bullet.pos.x <ent[i][j].pos.x+ent[i][j].size && ent[i][j].alive) {
            bullets.remove(b);
            ent[i][j].alive = false;
            player.score +=1;
            s[0].rewind();
            s[0].play();
          } else if (!bullet.tp && bullet.pos.y > player.pos2d.y && bullet.pos.y<player.pos2d.y+50 && bullet.pos.x >player.pos2d.x && bullet.pos.x <player.pos2d.x+50) {
            bullets.remove(b);
            pos.x=0;
            pos.y=0;
            player.alive=false;
          }
        }
      }
    }
  }
  void disparar() {
    for (int i = 0; i< ent.length; i++) {
      for (int j = 0; j <ent[i].length; j++) {
        if (ent[i][j].alive && player.alive) {
          ent[i][j].shoot(pr, ent[i][j].pos.x, ent[i][j].pos.y+15);
        }
      }
    }
  }
}
