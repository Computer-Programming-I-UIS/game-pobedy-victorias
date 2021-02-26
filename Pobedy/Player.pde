class Player {
  PVector pos2d, posv;
  boolean left=false, right=false, up=false, down=false, alive=true, jumping=false, falling=false, floor=true;
  int vel2d=5;
  int w=0;
  int lives=1;
  int size=50;
  float score=0.0;
  int status=0;
  Player() {
    pos2d = new PVector(375, 500);
  }
  void play() {
    if (alive) {
      image(pl[plsprite], pos2d.x, pos2d.y, 50, 64.28);
      if (plsprite==1) {
        turbin[turbinid].display(player.pos2d.x, player.pos2d.y+25);
      } else if (plsprite==0) {
        turbin[turbinid].display(player.pos2d.x-25, player.pos2d.y+40);
        turbin[turbinid].display(player.pos2d.x+25, player.pos2d.y+40);
      } else {
        turbin[turbinid].display(player.pos2d.x, player.pos2d.y+50);
      }
    }
  }
  void moveh(int dir) {
    pos2d.x +=vel2d*dir;
  }
  void movev(int dir) {
    pos2d.y +=vel2d*dir;
  }
  void update() {
    //Controles de usuario
    if (left && pos2d.x>20) {
      moveh(-1);
    } else if (right && pos2d.x<450.0) {
      moveh(1);
    }
    if (up && player.pos2d.y>420) {
      movev(-1);
    } else if (down && pos2d.y<530) {
      movev(1);
    }

    if (!alive) {
      anim.display(player.pos2d.x, player.pos2d.y);
      left=false;
      right=false;
      up=false;
      down=false;
      w=w+1;
      if (w==100) {
        player.lives -=1;
        s[0].rewind();
        s[0].play();
        alive=true;
        if(level==1){
        cen.reset();
        }else if(level==2){
          ce2.reset();
        }else if(level==3){
         ce3.reset(); 
        }
        pos2d.y=500;
        pos2d.x=175;
      }
    } else {
      w=0;
    }
  }
}
