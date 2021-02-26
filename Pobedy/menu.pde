void loadMenu() {
  loadLogo();
  menuButtons();
  menuMusic();
}
void menuMusic() {
  s[10].play();
  if (!s[10].isPlaying()) {
    s[10].rewind();
  }
}
void loadLogo() {
  image(menup, 0, 0);
}
void menuButtons() {
  for (int i=0; i<5; i++) {
    btn[i].load(350, 200+80*i);
  }
}
class mButton {
  boolean canclick =true;
  PVector pos;
  String btntxt[] = {"Jugar", "Config", "Tutorial", "Creditos", "Salir", "Volver", "Pause", "Play"};
  int bid;
  int almacenada=1;
  boolean image=false;
  boolean tanim;
  PImage imagedir;
  mButton(int id, boolean hasimage, boolean hasanim) {
    pos = new PVector();
    bid = id;
    image=hasimage;
    tanim=hasanim;
  }
  void load(float x, float y) {
    pos.x = x;
    pos.y = y;

    if (image) {
      visualPlace();
      visualCommand();
    } else if (tanim) {
      animplace();
      visualCommand();
    } else {
      place();
      command();
    }
  }
  void place() {
    noStroke();
    fill(#FFFFFF);
    rect(pos.x, pos.y, 100, 30, 50, 50, 50, 50); 
    fill(0);
    text(btntxt[bid], pos.x+20, pos.y+20);
  }
  void visualPlace() {
    if (plsprite==bid) {
      noFill();
      rect(pos.x-1, pos.y-1, 51, 51);
    }
    image(imagedir, pos.x, pos.y, 50, 50);
  }
  void animplace() {
    if (turbinid==bid) {
      noFill();
      stroke(0);
      rect(pos.x-1, pos.y-1, 51, 51);
    }
    turbin[bid].display(pos.x, pos.y);
  } 

  void backplace(int x, int y, int id, String tx) {
    fill(#FFFFFF);

    textSize(15);
    if (id==999) {
      fill(#FFFFFF);
      rect(x, y, 150, 30, 50, 50, 50, 50); 
      fill(0);
      
      text(tx, x+10, y+20);
    } else {
      fill(#FFFFFF);
      rect(x, y, 100, 30, 50, 50, 50, 50); 
      fill(0);
      text(tx, x+20, y+20);
    }

    pos.x=x;
    pos.y=y;
    bid=id;
    command();
  }
  void command() {
    if (mouseInLeftC(pos.x, pos.y, pos.x+100, pos.y+30)) {

      if (bid==0) {
        gamestart();
      } else if (bid==1) {
        window=2;
      } else if (bid==2) {
        
        window=5;
      } else if (bid==3) {
        window=3;
      } else if (bid==4) {
        if(window==0){
        exit();
        }else if(window!=0){
         window=0; 
        }
        
      } else if (bid==5) {
        
        if (window!=4 && canclick) {
          almacenada=window;
          window=4;
          canclick=false;
        }
      } else if (bid==6) {
        if (window==4 && canclick) {
          window=almacenada;
          canclick=false;
        }
      } else if (bid==999) {
        level=level+1; 
        window=1;
        
        player.pos2d.x=375;
        player.pos2d.y=500;
      }
    }
    if (mousePressed==false) {
      canclick=true;
    }
  }
  void visualCommand() {
    if (mouseInLeftC(pos.x, pos.y, pos.x+50, pos.y+50)) {
      if (bid==0) {
        if (image && !tanim) {
          plsprite=0;
          s[6].rewind();
          s[6].play();
        } else if (tanim) {
          turbinid=0;
          s[6].rewind();
          s[6].play();
        } else if (image && window==1) {
          level+=1;
        }
      } else if (bid==1) {
        if (image && !tanim) {
          plsprite=1;
          s[7].rewind();
          s[7].play();
        } else if (tanim) {
          turbinid=1;
          s[7].rewind();
          s[7].play();
        }
      } else if (bid==2) {
        if (image && !tanim) {
          plsprite=2;
          s[6].rewind();
          s[6].play();
        } else if (tanim) {
          turbinid=0;
          s[6].rewind();
          s[6].play();
        }
      } else if (bid==3) {
        exit();
      } else if (bid==4) {
        window=0;
      } else if (bid==5 && canclick) {
        if (window!=4) {
          almacenada=window;
          window=4;
          canclick=false;
        }
      } else if (bid==6 && canclick) {
        if (window==4) {
          window=almacenada;
          canclick=false;
        }
      }
    }
    if (mousePressed==false) {
      canclick=true;
    }
  }
}
