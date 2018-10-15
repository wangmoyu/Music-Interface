//Three dataanalyze for top10
int[] locationI1 = new int[10];
int[] locationJ1 = new int[10];
String[] track1 = new String[10];
int[] locationI3 = new int[10];
int[] locationJ3 = new int[10];
String[] track3 = new String[10];
double[] dancStoreArray = new double[10];
double[] valStoreArray = new double[10];
double[] tempStoreArray = new double[10];
//Sort algorithm
void inisStoreArray1(){
  for(int i=0; i < dancStoreArray.length; i++){
    dancStoreArray[i] = -1;
  }
}

void storeInArray1(double a) {
  if(dancStoreArray[0] < a) {
    int n;
    dancStoreArray[0] = a;
    sortDouble(dancStoreArray);
    for(n=0;n<10;n++){
      if(dancStoreArray[n] == a)
      break;
    }
  }
}

void inisStoreArray3(){
  for(int i=0; i < tempStoreArray.length; i++){
    tempStoreArray[i] = -1;
  }
}

void storeInArray3(double a) {
  if(tempStoreArray[0] < a) {
    int n;
    tempStoreArray[0] = a;
    sortDouble(tempStoreArray);
    for(n=0;n<10;n++){
      if(tempStoreArray[n] == a)
      break;
    }
  }
}

double[] sortDouble(double[] a) {
  for(int i =0; i < 9; i++){
    for(int j =0; j<9-i;j++){
      if(a[j]>a[j+1]){
        double swap;
        swap = a[j];
        a[j]=a[j+1];
        a[j+1]=swap;
      }
    }
  }
  return a;
}
//Draw results
void analyze() {
  y2 =130;
  values = loadJSONArray("NOW-US-1-61.json");
  if(getIndex == 1 ){   
  for (int l =9; l >= 0; l--){
    int I=locationI1[l],J=locationJ1[l];
    JSONObject album = values.getJSONObject(I);
    String[] tracks = album.getJSONArray("tracks").getStringArray();
    JSONArray artists = album.getJSONArray("artists");
    String[] artistsName = artists.getStringArray();
    String label1 = tracks[J];
    String label2 = artistsName[J];
    button2 = new Button2(label1, label2, 500, y2 += 50);
    button2.draw();
  }
}

 if(getIndex == 3 ){   
  for (int l =9; l >= 0; l--){
    int I=locationI3[l],J=locationJ3[l];
    JSONObject album = values.getJSONObject(I);
    String[] tracks = album.getJSONArray("tracks").getStringArray();
    JSONArray artists = album.getJSONArray("artists");
    String[] artistsName = artists.getStringArray();
    String label1 = tracks[J];
    String label2 = artistsName[J];
    button2 = new Button2(label1, label2, 500, y2 += 50);
    button2.draw();
  }
}
}