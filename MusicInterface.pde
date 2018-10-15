 import controlP5.*;
import processing.sound.*;
ControlP5 cp5;

PImage backgroundMap;
JSONArray values;
PFont font;
PFont textFont;
String[] releaseDateArray = new String[60];
Float[] Dance = new Float[10];
String releaseDate;
String labelGet1, labelGet2, labelGet3;
String searchYear;
int year = 1998;
int x1, y1, x2, y2;
boolean yearSearch = false, volumeSearch = false, tracksSearch = false, analyze = false, loadimage = false;
String image;
int index = 0, getIndex = 0;
String SoundFile = "Viva la Vida-Coldplay.mp3";
SoundFile Sound;
Button1 button1;
Button2 button2;
Button3 button3;
TrackDetails trackDetails;

void setup() {
  backgroundMap = loadImage("background.jpg");
  size(1200, 1200);
  font = createFont("Consolas", 15);
  textFont(font);

  //DataAnalyze for locationArray
  values = loadJSONArray("NOW-US-1-61.json");
  for (int i = 0; i < 60; i++) {    
    JSONObject album = values.getJSONObject(i);
    double[] tempo = album.getJSONArray("tempo").getDoubleArray();
    double[] danceability = album.getJSONArray("danceability").getDoubleArray();

    releaseDate = album.getString("releaseDate"); 
    for (int j = 0; j < danceability.length; j++) {  
      storeInArray1(danceability[j]);
    }

    for (int j = 0; j < tempo.length; j++) {  
      storeInArray3(tempo[j]);
    }
  }

  for (int i = 0; i < 60; i++) {
    JSONObject album = values.getJSONObject(i);
    String[] tracks = album.getJSONArray("tracks").getStringArray();
    double[] danceability = album.getJSONArray("danceability").getDoubleArray();
    for (int j = 0; j < danceability.length; j++) {  
      for (int k = 0; k < 10; k ++) {
        boolean compare =true;
        for(int l = 0; l < 10;l++){
          if(tracks[j].equals(track1[l])){
             compare = false;
          }}          
        if ((dancStoreArray[k] == danceability[j])&&(compare == true)) {          
          locationI1[k] = i;           
          locationJ1[k] = j;
          track1[k] = tracks[j];
        }
      }
    }
  }

  for (int i = 0; i < 60; i++) {
    JSONObject album = values.getJSONObject(i);
    String[] tracks = album.getJSONArray("tracks").getStringArray();
    double[] tempo = album.getJSONArray("tempo").getDoubleArray();
    for (int j = 0; j < tempo.length; j++) {  
      for (int k = 0; k < 10; k ++) {
        boolean compare =true;
        for(int l = 0; l < 10;l++){
          if(tracks[j].equals(track3[l])){
             compare = false;
          }}          
        if ((tempStoreArray[k] == tempo[j])&&(compare == true)) {          
          locationI3[k] = i;           
          locationJ3[k] = j;
          track3[k] = tracks[j];
        }
      }
    }
  }

  // Year search control and sound control button by controlP5*  
  cp5 = new ControlP5(this);
  cp5.addTextfield("Year").setPosition(130, 205).setSize(50, 30).setFont(font).setColor(color(255)).setColorBackground(0).setAutoClear(false);
  cp5.addBang("Search").setPosition(200, 205).setSize(40, 30).setFont(font).setColorForeground(color(30, 100, 255));
  cp5.addBang("Clear").setPosition(270, 205).setSize(40, 30).setFont(font).setColorForeground(color(30, 100, 255));
  cp5.addBang("Last").setPosition(70, 180).setSize(40, 20).setFont(font).setColorForeground(color(30, 100, 255));
  cp5.addBang("Next").setPosition(70, 240).setSize(40, 20).setFont(font).setColorForeground(color(30, 100, 255));
  cp5.addBang("Start").setPosition(80, 1120).setSize(40, 20).setFont(font).setColorForeground(color(30, 100, 255));
  cp5.addBang("Stop").setPosition(150, 1120).setSize(40, 20).setFont(font).setColorForeground(color(30, 100, 255));
  Sound = new SoundFile(this, SoundFile);
  Sound.amp(1);
  Sound.loop();
}

void draw() {
  //draw interface
  background(backgroundMap);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("Search From 1998 to 2016", 190, 130);
  textSize(35);
  text("NOW That's What I Call Music!", 600, 50);
  stroke(255);
  fill(255);
  line(0, 100, 1200, 100);
  fill(255);
  line(0, 320, 360, 320);
  fill(255);
  line(360, 100, 360, 320);  

  // draw result of searchYear
  if (yearSearch == true) {
    textSize(15);
    fill(255);
    text("Volume release date", 520, 130);
    volumeOfYear();
  }
  // draw volume of releasetime
  if (volumeSearch == true) {
    tracksOfvolume();
  }
  // draw details of track
  if (tracksSearch == true) {
    detailsOftracks();
  }
  //dataAnalyze functions and buttons
  firstAnalyze();
  trdAnalyze();
  if (analyze == true) {
    int h =150;
    for (int i=1; i<11; i++) {
      text(str(i), 480, h+=50);
    }
    analyze();
  }
}

// search,clear,page plus,page decrease button function
void Search() {
  println();
  print("The release year of volume you search :");
  searchYear = cp5.get(Textfield.class, "Year").getText();
  print(searchYear); 
  yearSearch = true;
  volumeSearch = false;
}

void Clear() {
  cp5.get(Textfield.class, "Year").clear();
  yearSearch = false;
  volumeSearch = false; 
  tracksSearch = false;
  analyze = false;
}
void Last() {
  searchYear = cp5.get(Textfield.class, "Year").getText();
  year = int(searchYear);
  if (year > 1998) {
    year = year - 1;
  } else {
    year = 1998;
  }
  cp5.get(Textfield.class, "Year").setText(str(year));
  yearSearch = true;
  volumeSearch = false;
  tracksSearch = false;
  analyze = false;
  searchYear = str(year);
}
void Next() {
  searchYear = cp5.get(Textfield.class, "Year").getText();
  year = int(searchYear);
  if ((year < 2016)&&(year >1997)) {
    year = year + 1;
  } else if (year < 1998) {
    year = 1998;
  } else {
    year = 2016;
  }
  cp5.get(Textfield.class, "Year").setText(str(year));
  yearSearch = true;
  volumeSearch = false;
  tracksSearch = false;
  analyze = false;
  searchYear = str(year);
}
// Sound stop and restart
void Start() {
  Sound.loop();
}
void Stop() {
  Sound.stop();
}

// Get and visualise data from JSON.
// Present result of volumes searched by year
void volumeOfYear() { 
  y1 = 115;
  values = loadJSONArray("NOW-US-1-61.json");
  for (int i = 0; i< 60; i++) {
    JSONObject album = values.getJSONObject(i);
    releaseDate = album.getString("releaseDate");
    releaseDateArray[i] =  releaseDate;
    String label = releaseDateArray[i];
    String[] pieces = split(releaseDateArray[i], ' ');

    if (int(searchYear) == int(pieces[2])) {
      button1 = new Button1(label, 430, y1 += 40);     
      button1.draw();
    }
  }
}
//Present tracks and artists of the volume
void tracksOfvolume() {
  y2 = 70;
  values = loadJSONArray("NOW-US-1-61.json");
  for (int i = 0; i < 60; i++) {
    JSONObject album = values.getJSONObject(i);
    String[] tracks = album.getJSONArray("tracks").getStringArray();
    JSONArray artists = album.getJSONArray("artists");
    String[] artistsName = artists.getStringArray();
    releaseDate = album.getString("releaseDate");
    if (labelGet1.equals(releaseDate)) {
      for (int j = 0; j < tracks.length; j++) {
        String label1 = tracks[j];
        String label2 = artistsName[j];
        button2 = new Button2(label1, label2, 680, y2 += 50);
        button2.draw();
      }
    }
  }
}
//Present details of track 
void detailsOftracks() {
  values = loadJSONArray("NOW-US-1-61.json");    
  for (int i = 0; i < 60; i++) {    
    JSONObject album = values.getJSONObject(i);
    int volume = album.getInt("volume");
    JSONArray artists = album.getJSONArray("artists");
    String[] artistsName = artists.getStringArray();
    String[] spotifyIDs = album.getJSONArray("spotifyIDs").getStringArray();
    double[] tempo = album.getJSONArray("tempo").getDoubleArray();
    double[] danceability = album.getJSONArray("danceability").getDoubleArray();
    double[] valence = album.getJSONArray("valence").getDoubleArray();
    String[] tracks = album.getJSONArray("tracks").getStringArray();     
    releaseDate = album.getString("releaseDate"); 
    for (int j = 0; j < tracks.length; j++) {  
      String artistName = artistsName[j];
      String ID = spotifyIDs[j];
      double tem = tempo[j];
      double dan = danceability[j];
      double val = valence[j];
      String track = tracks[j];
      if ((labelGet2.equals(track))&&(labelGet3.equals(artistName))) {
        trackDetails = new TrackDetails(volume, releaseDate, artistName, ID, tem, dan, val, track);
        trackDetails.draw();
      }
    }
  }
}
//Dataanalyze choice button
void firstAnalyze() {
  String label = "Top 10 Dance Music";//danceability
  index = 1;
  button3 = new Button3(index, label, 100, 440);
  button3.draw();
}

void trdAnalyze() {
  String label = "Top 10 Quick Music";//tempo
  index = 3;
  button3 = new Button3(index, label, 100, 540);
  button3.draw();
}