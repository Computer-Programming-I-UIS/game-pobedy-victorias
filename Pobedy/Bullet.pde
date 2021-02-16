class Bullet{
 PVector pos;
 int speed = 10;
 boolean tp;
 Bullet(float x, float y,boolean type){
   if(type){
   x=x+25; 
  }else{
   speed=2; 
  }
  pos= new PVector(x,y);
  
  
 tp=type;
 }

 void update(){
  if(tp && player.alive){
    pos.y = pos.y - speed;
    if(plsprite==0){
      rect(pos.x-15,pos.y+15,5,5);
      rect(pos.x+15,pos.y+15,5,5);
    }else if(plsprite==1){
      rect(pos.x,pos.y,5,5);
    }
    else if(plsprite==2){
      fill(#0DFF33);
    rect(pos.x,pos.y,5,5);
    }
    
   
    }else if(!tp && player.alive){
      pos.y = pos.y + speed;
      fill(0);
      rect(pos.x,pos.y,5,10);
    }
   if (pos.x > 0 && pos.x < width && pos.y > 0 && pos.y < height) {
     
    }
    else {
      bullets.remove(b);
    }

   
     
  
 }
  
}
