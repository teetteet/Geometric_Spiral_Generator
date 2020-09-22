//SPirals
float h = 50;  //wave amplitude
float t = 0; //time - t is iterated over and over
float r = 0, g = 0, b = 0; //colors rgb
boolean rampup = true;

//spiral properties
float growth = 0;    //spiral growth speed
float rough = 0;     //rough var

float x, y;

color col = #000001;

String shape = "circle";
void setup(){
  size(720,540);
  background(0);
  strokeWeight(5);
  stroke(255,0,0);
  noFill();
  
}


void draw(){   

  translate(width/2, height/2);

   rampColor();
  if(abs(x) >= width){ //draw only 50 pixels outside
     t = 0;
     growth++;
     rough++;
  }
  else{
    x = x(t, rough, growth);
    y = y(t, rough, growth);
  }
  


    
    if(shape == "line"){
        line(x,y, x(t+1, rough, growth), y(t+1, rough, growth));
    }
    else if(shape == "triangle")
      triangle(0,0, x,y, 
              x(t+1, rough, growth), y(t+1, rough, growth)); 
    else if(shape == "circle")
      ellipse(x,y,t, t); 
    else 
      point(x,y);
    
  t++;

}

//spiral is just x and y
float x(float t, float rough, float growth){
  return (cos(t/rough)) *(log(t/growth + 1)) * h;
  //siniosoid 
}

float y(float t,float rough, float growth){
  return (sin(t/rough)) *(log(t/growth + 1)) * h;
}


void rampColor(){
    if(r >= 250 && g >= 250 && b >= 250){
     rampup = false;
     r = 250;
    }
    if(r < 3 && g < 3 && b < 3){
     rampup = true;
     r = 5;
    }
    //increase the rgb scale
    if(rampup){
     r++;
     if(r >= 250){
       r = 250;
       g++;
       if(g >= 250){
         g = 250;
         b++;
       }
     }
    }
    else{ //decrease rgb scale
     r--;
     if(r < 3){
       g--;
       if(g < 3)
         b--;
     }
    }

    stroke(r,g,b);  
    
  
}

void mouseClicked(){
  background(0);
  t = 0;
  growth++;
  rough++;
}