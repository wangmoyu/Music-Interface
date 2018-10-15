//This button used for datanalyze
class Button3 {
  private int index;
  private String label;
  private int  x, y; 
  private PFont font;
  
  Button3(int index, String label, int x, int y) {
    this.index = index;
    this.label = label;
    this.x = x;
    this.y = y;
    this.font = createFont("Consolas", 15, true);
  }
  
  void draw() {    
    if (MouseIsOver() == true){
      fill(color(0, 255, 255));
    }else{
      fill(255,0);
    }
    stroke(255);
    rect(x, y, 200, 50, 10);
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(255);
    text(label, x + 100, y + 25);
    if ((mousePressed==true)&&(MouseIsOver()==true)) {
      analyze = true;
      yearSearch = false;
      volumeSearch = false;
      tracksSearch = false;
      getIndex = this.index;
    }
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + 200) && mouseY > y && mouseY < (y + 50)) {
      return true;
    }
    return false;
  }  
}