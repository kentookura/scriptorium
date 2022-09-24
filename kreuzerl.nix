
kreuzerl =  {problemSet, schedule}: {
  output = 
  "Kreuzerlübungsbericht" : [ excel xml ] 
     #should be immediately accesible via button
  Erstellung der "Kreuzerllisten": 
    each week:
      settings:  (Abgabe-Zeitpunkt, Bewertungsmodus, etc.) 
  

}

example = kreuzer { 
  problemSet = {}, 
  schedule = builtins.readFile
}
