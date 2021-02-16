void keyPressed(){

  if(window == 1 && player.alive){
 if(player.status ==0){
  switch(keyCode){
   case 'w':
   case UP:
   case 'W':
     player.up=true;
     break;
   case 'a':
   case 'A':
   case LEFT:
     player.left=true;
     break;
   case 's':
   case 'S':
   case DOWN:
     player.down=true;
     break;
   case 'd':
   case 'D':
   case RIGHT:
    player.right=true;
     break;
   case ' ':
     bullets.add( new Bullet(player.pos2d.x,player.pos2d.y,true));
     s[1].rewind();
     s[1].play();
     break;
   case 'p':
   case 'P':
     presume();
     canpresume=false;
  }

   
 }
 }else if(window == 4 && !victory[level] && !gameover){
   switch(keyCode){
    case 'P':
    case 'p':
     presume();
     canpresume=false;      
   }
   
 }
}
void keyReleased(){
    if(window !=0){
 if(player.status ==0){
 
  switch(keyCode){
   case 'w':
   case UP:
   case 'W':
     player.up=false;
     break;
   case 'a':
   case 'A':
   case LEFT:
     player.left=false;
     break;
   case 's':
   case 'S':
   case DOWN:
     player.down=false;
     break;
   case 'd':
   case 'D':
   case RIGHT:
     player.right=false;
     break;
   case 'p':
   case 'P':
     canpresume=true;
     break;

    
  }

   
 }
 }
  
}
