//This button class used for releasetime
class Button1 {
  private String label;
  private int  x, y; 
  private PFont font;
  
  Button1(String label, int x, int y) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.font = createFont("Consolas", 15, true);
  }
  
  void draw() { 
    if (MouseIsOver() == true){
    fill(color(0, 255, 255));
    }else{
    fill(0,0);
    }
    stroke(255);
    rect(x, y, 200, 24, 10);
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(255);
    text(label, x + 100, y + 12);
    if ((mousePressed==true)&&(MouseIsOver()==true)) {
      volumeSearch = true;
      tracksSearch = false;
      analyze = false;
      labelGet1 = this.label;
    }
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + 200) && mouseY > y && mouseY < (y + 24)) {
      return true;
    }
    return false;
  }  
}