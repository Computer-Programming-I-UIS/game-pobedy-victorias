void loadGamePlay(){
  if(level==0){
  disableNoGameSounds();
  background(0);
  image(fondo,0,0,600,600);
  text("Vidas:",550,50);
  text("Puntaje:   "+player.score,550,100);
   btn[5].backplace(600,400,5, "Pausar");
   btn[4].backplace(600,200,4, "Menú");
  
  for(int i=0;i<player.lives;i++){
    image(live,600+30*i,35,25,25);
  }
  player.play();
  player.update();
  for (b = bullets.size()-1; b >= 0; b--) {
    Bullet bullet = bullets.get(b);
    bullet.update();
}

cen.EnemyPlace();
cen.disparar();
cen.update();
  }
}
void gamePaused(){
  
  
  btn[4].backplace(600,200,4, "Menú");
  if(victory[level] && level<maxlevel){
  fill(#FFFFFF);
  rect(250,250,300,100);
  fill(0);
  text("Victoria!", 300,275);
}else if(!victory[level]){
  btn[5].backplace(600,400,6, "Jugar");
}
}
void disableNoGameSounds(){
 if(s[10].isPlaying()){
  s[10].pause(); 
 }
  
  
}
