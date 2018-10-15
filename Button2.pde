//This button used for artists and tracks
class Button2 {
  private String label1;
  private String label2;
  private int  x, y; 
  private PFont font;
  
  Button2(String label1, String label2, int x, int y) {
    this.label1 = label1;
    this.label2 = label2;
    this.x = x;
    this.y = y;
    this.font = createFont("Consolas", 12, true);
  }
  
  void draw() {  
    if (MouseIsOver() == true){
    fill(color(0,255,255));
    }else{
    fill(0,0);
    }
    stroke(255);
    rect(x, y, 500, 40, 10);
    textFont(font);
    textAlign(LEFT, CENTER);
    fill(255);
    text(label1, x + 20, y + 10);
    text(label2, x + 20, y + 30);
    
    if ((mousePressed==true)&&(MouseIsOver()==true)) {
      tracksSearch = true;
      loadimage = true;
      labelGet2 = this.label1;
      labelGet3 = this.label2;
    }
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + 500) && mouseY > y && mouseY < (y + 48)) {
      return true;
    }
    return false;
  } 
}