void levelLoad() {

  if (level==1) {
    background(#102074);
    mapdraw();
    player.play();
    player.update();
    for (b = bullets.size()-1; b >= 0; b--) {
      Bullet bullet = bullets.get(b);
      bullet.update();
    }

    cen.EnemyPlace();
    cen.disparar();
    cen.update();
  } else if (level == 2) {
    background(#74E9FF);
    mapdraw();
    for(int i=0;i<plataformas.length;i++){
      plataformas[i].place();
      
    }
  }
}
class platforms{
  PVector pos;
    platforms(float px, float py){
     pos = new PVector(px,py); 
      
    }
  void place(){
    rect(pos.x,pos.y,150,20);
    
  }
  void update(){
    if(player.posv.x > pos.x && player.posv.x < pos.x+150 && player.posv.y>pos.y+20 && player.posv.y<pos.y){
      player.falling=false;
    }
  }
  
  
}
