//Draw details
class TrackDetails {
  private int volume;
  private String releaseDate;
  private String artistName;
  private String ID;
  private double tem;
  private double dan;
  private double val;
  private String track;
  private PFont font;  
  private PImage img;
   
  TrackDetails(int volume, String releaseDate, String artistName, String ID, double tem, double dan, double val, String track){
    this.volume = volume;
    this.releaseDate = releaseDate;
    this.artistName = artistName;
    this.ID = ID;
    this.tem = tem;
    this.dan = dan;
    this.val = val;
    this.track = track;
    this.font = createFont("Consolas", 15, true);     
  }
  
  void draw() {
    textAlign(LEFT,CENTER);
    textFont(font);
    fill(255);
    text("Volume: "+ volume, 300, 720);
    text("ReleseDate: "+ releaseDate, 300, 760);
    text("Track: "+ track, 30, 950);
    text("Artist: "+ artistName, 30, 990);
    text("SpotifyID: "+ ID, 30, 1030);
    text("Tempo: "+ tem, 300, 800);
    text("Valence: "+ val, 300, 840);
    text("Danceability: "+dan, 300, 880);
    stroke(255);
    fill(0,0);
    rect(20, 690, 650, 380, 10);
    if(loadimage == true){
    String[] url = loadStrings("http://moody2.ucc.ie/test/Authoring/getSpot.php?track="+ID); 
    loadimage = false;
    image = url[0];
    }
    this.img = loadImage(image,"jpg");
    this.img.resize(0,200);
    image(this.img, 30, 700);
  }
}