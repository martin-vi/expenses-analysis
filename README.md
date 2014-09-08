# R Ausgaben Analyse 

Auswertung von Ausgaben von zwei Personen über mehrere Tage.

**Ziel**: R lernen …

## compile R script

```
R --no-save < analysis.R
```

Verwendete R Bibliotheken:

* reshape2
* ggplot2

## Plots / Ausgabe
![plot1](https://raw.githubusercontent.com/martin-vi/expenses-analysis/master/img/plot-1.png)

![plot2](https://raw.githubusercontent.com/martin-vi/expenses-analysis/master/img/plot-2.png)

![plot3](https://raw.githubusercontent.com/martin-vi/expenses-analysis/master/img/plot-3.png)

## Daten

| Datum | Wochentag  | Bezahler/in | Betrag in € |
| ----- | ---------- | ----------- | ----------- |
| 14.8. | Donnerstag | Person A    | 15          |
| 14.8. | Donnerstag | Person B    | 10          |
| 14.8. | Donnerstag | Person B    | 21.35       |
| 15.8. | Freitag    | Person A    | 1.8         |
| 15.8. | Freitag    | Person A    | 23.68       |
| 15.8. | Freitag    | Person A    | 4.7         |
| 16.8. | Samstag    | Person B    | 32.25       |
| 16.8. | Samstag    | Person A    | 3.8         |
| 16.8. | Samstag    | Person B    | 13.13       |
| 17.8. | Sonntag    | Person B    | 11          |
| 17.8. | Sonntag    | Person A    | 10          |
| 18.8. | Montag     | Person B    | 15.40       |
| 19.8. | Dienstag   | Person A    | 28          |
| 20.8. | Mittwoch   | Person B    | 3.98        |
| 21.8. | Donnerstag | Person A    | 40.19       |
| 22.8. | Freitag    | Person B    | 2.20        |
| 22.8. | Freitag    | Person A    | 0.20        |
| 22.8. | Freitag    | Person B    | 11.39       |
| 22.8. | Freitag    | Person B    | 8.6         |
| 23.8. | Samstag    | Person B    | 4           |
| 23.8. | Samstag    | Person A    | 15          |
| 24.8. | Sonntag    | Person A    | 37          |
| 25.8. | Montag     | Person B    | 2.16        |
| 25.8. | Montag     | Person B    | 4           |
| 25.8. | Montag     | Person B    | 3.2         |
| 25.8. | Montag     | Person A    | 5           |
| 25.8. | Montag     | Person B    | 44.86       |
| 26.8. | Dienstag   | Person B    | 5.9         |

Rohdaten für R, [hier](master/data.txt).
