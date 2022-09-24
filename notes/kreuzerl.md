```nix
input: types.listOf problemSet

output: 
  "Kreuzerlübungsbericht" : [ excel xml ] 
     #should be immediately accesible via button
  Erstellung der "Kreuzerllisten": 
    each week:
      settings:  (Abgabe-Zeitpunkt, Bewertungsmodus, etc.) 
  

  z.B.: Übung beginnt am Donnerstag um 09:00
    letzte Abgabezeitpunkt : [Abend davor (z.B. Mittwoch um 18:00)]
    Bewertungsschema : [Keine Punkte]
    Beispielformatierung : [...]
```
