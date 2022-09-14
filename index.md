# Hinweise {.unnumbered}




![Text als Datenbasis prädiktiver Modelle](img/text-mining-1476780_640.png){width=25%}
Bild von <a href="https://pixabay.com/de/users/mcmurryjulie-2375405/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1476780">mcmurryjulie</a> auf <a href="https://pixabay.com/de//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1476780">Pixabay</a>



---

🚧WORK IN PROGRESS🚧

---




## Lernziele

Nach diesem Kurs sollten Sie ...

- Daten aus Sozialen Netzwerken wie Twitter automatisiert in großer Menge auslesen können
- Gängige Methoden des Textsminings mit R anwenden können (z.B. Tokenizing, Stemming, Regex)
- Verfahren des Maschinenlernens auf Textdaten anwenden können
- Den Forschungsstand zum Thema Erkennung von Hate Speech in Ausschnitten kennen




## Voraussetzungen

Um von diesem Kurs am besten zu profitieren,
sollten Sie folgendes Wissen mitbringen:

    
- fortgeschrittene Kenntnisse im Umgang mit R, möglichst auch mit dem tidyverse
- fortgeschrittene Kenntnisse der deskriptiven Statistik
- fortgeschrittene Kenntnis der Regressionsanalyse
- grundlegende Kenntnisse des Maschinenlernens




## Software

- Installieren Sie [R und seine Freunde](https://data-se.netlify.app/2021/11/30/installation-von-r-und-seiner-freunde/).

- Installieren Sie die folgende R-Pakete^[falls Sie die Pakete schon installiert haben, könnten Sie mal in RStudio auf "update.packages" klicken]:
    - tidyverse
    - tidymodels
    - easystats
    - weitere Pakete werden im Unterricht bekannt gegeben (es schadet aber nichts, jetzt schon Pakete nach eigenem Ermessen zu installieren)
- [R Syntax aus dem Unterricht](https://github.com/sebastiansauer/Lehre) findet sich im Github-Repo bzw. Ordner zum jeweiligen Semester.



## Lernhilfen


### Videos

- Auf dem [YouTube-Kanal des Autors](https://www.youtube.com/channel/UCkvdtj8maE7g-SOCh4aDB9g) finden sich eine Reihe von Videos mit Bezug zum Inhalt dieses Buches.



### Online-Zusammenarbeit

Hier finden Sie einige Werkzeuge, 
die das Online-Zusammenarbeiten vereinfachen: 

- [Frag-Jetzt-Raum zum anonymen Fragen stellen während des Unterrichts](https://frag.jetzt/home). Der Keycode wird Ihnen bei Bedarf vom Dozenten bereitgestellt.
- [Padlet](https://de.padlet.com/) zum einfachen (und anonymen) Hochladen von Arbeitsergebnissen der Studentis im Unterricht. Wir nutzen es als eine Art Pinwand zum Sammeln von Arbeitsbeiträgen. Die Zugangsdaten stellt Ihnen der Dozent bereit.





## Modulzeitplan






::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="wenfwflsuq" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#wenfwflsuq .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#wenfwflsuq .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wenfwflsuq .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#wenfwflsuq .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#wenfwflsuq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wenfwflsuq .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wenfwflsuq .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#wenfwflsuq .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#wenfwflsuq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#wenfwflsuq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#wenfwflsuq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#wenfwflsuq .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#wenfwflsuq .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#wenfwflsuq .gt_from_md > :first-child {
  margin-top: 0;
}

#wenfwflsuq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#wenfwflsuq .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#wenfwflsuq .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#wenfwflsuq .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#wenfwflsuq .gt_row_group_first td {
  border-top-width: 2px;
}

#wenfwflsuq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wenfwflsuq .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#wenfwflsuq .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#wenfwflsuq .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wenfwflsuq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wenfwflsuq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#wenfwflsuq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#wenfwflsuq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wenfwflsuq .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#wenfwflsuq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#wenfwflsuq .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#wenfwflsuq .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#wenfwflsuq .gt_left {
  text-align: left;
}

#wenfwflsuq .gt_center {
  text-align: center;
}

#wenfwflsuq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#wenfwflsuq .gt_font_normal {
  font-weight: normal;
}

#wenfwflsuq .gt_font_bold {
  font-weight: bold;
}

#wenfwflsuq .gt_font_italic {
  font-style: italic;
}

#wenfwflsuq .gt_super {
  font-size: 65%;
}

#wenfwflsuq .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#wenfwflsuq .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#wenfwflsuq .gt_indent_1 {
  text-indent: 5px;
}

#wenfwflsuq .gt_indent_2 {
  text-indent: 10px;
}

#wenfwflsuq .gt_indent_3 {
  text-indent: 15px;
}

#wenfwflsuq .gt_indent_4 {
  text-indent: 20px;
}

#wenfwflsuq .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col">Nr</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">Thema</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">Datum</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">Kommentar</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_right">1</td>
<td class="gt_row gt_left">Twitter Mining</td>
<td class="gt_row gt_left">3. - 7. Okt. 2022</td>
<td class="gt_row gt_left">Die erste Unterrichtsstunde fällt auf den 7. Okt. 2023.</td></tr>
    <tr><td class="gt_row gt_right">2</td>
<td class="gt_row gt_left">Text Mining Grundlagen</td>
<td class="gt_row gt_left">10. - 14. Okt. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">3</td>
<td class="gt_row gt_left">Fallstudie Populismus</td>
<td class="gt_row gt_left">17. - 21. Okt. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">4</td>
<td class="gt_row gt_left">Word Embeddings</td>
<td class="gt_row gt_left">24. - 28. Okt. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">5</td>
<td class="gt_row gt_left">Projektwoche Twitter Hate Speech</td>
<td class="gt_row gt_left">31. Okt. - 4. Nov. 22</td>
<td class="gt_row gt_left">Ab diese Woche benötigen wir rstanarm.</td></tr>
    <tr><td class="gt_row gt_right">6</td>
<td class="gt_row gt_left">Hate Speech - Stand der Forschung</td>
<td class="gt_row gt_left">7. - 11. Nov. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">NA</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">14. - 18. Nov. 22</td>
<td class="gt_row gt_left">Kein regulärer Unterricht</td></tr>
    <tr><td class="gt_row gt_right">7</td>
<td class="gt_row gt_left">Regression</td>
<td class="gt_row gt_left">21. - 25. Nov. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">8</td>
<td class="gt_row gt_left">Klassifikation</td>
<td class="gt_row gt_left">28. Nov. - 2. Dez. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">9</td>
<td class="gt_row gt_left">Projektwoche Twitter Hate Speech 2</td>
<td class="gt_row gt_left">5. Dez. - 9. Dez. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">10</td>
<td class="gt_row gt_left">Quarto Blog</td>
<td class="gt_row gt_left">12. - 16. Dez. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">11</td>
<td class="gt_row gt_left">Coaching</td>
<td class="gt_row gt_left">19. - 23. Dez. 22</td>
<td class="gt_row gt_left">NA</td></tr>
    <tr><td class="gt_row gt_right">NA</td>
<td class="gt_row gt_left">WEIHNACHTSFERIEN</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">Kein Unterricht</td></tr>
    <tr><td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Abschluss</td>
<td class="gt_row gt_left">9. Jan. 23 - 13. Jan. 23</td>
<td class="gt_row gt_left">NA</td></tr>
  </tbody>
  
  
</table>
</div>
```

:::
:::









## Literatur

Zentrale Begleitliteratur ist @smltar; der Volltext ist [hier](https://smltar.com/) verfügbar.

Pro Thema wird ggf. weitere Literatur ausgewiesen. 



## Technische Details

Dieses Dokument wurde erzeut am/um 2022-09-14 11:55:04.



::: {.cell}
::: {.cell-output .cell-output-stdout}
```
─ Session info ───────────────────────────────────────────────────────────────
 setting  value
 version  R version 4.2.1 (2022-06-23)
 os       macOS Big Sur ... 10.16
 system   x86_64, darwin17.0
 ui       X11
 language (EN)
 collate  en_US.UTF-8
 ctype    en_US.UTF-8
 tz       Europe/Berlin
 date     2022-09-14
 pandoc   2.19.2 @ /usr/local/bin/ (via rmarkdown)

─ Packages ───────────────────────────────────────────────────────────────────
 package     * version    date (UTC) lib source
 assertthat    0.2.1      2019-03-21 [1] CRAN (R 4.2.0)
 cellranger    1.1.0      2016-07-27 [1] CRAN (R 4.2.0)
 cli           3.3.0      2022-04-25 [1] CRAN (R 4.2.0)
 colorout    * 1.2-2      2022-06-13 [1] local
 colorspace    2.0-3      2022-02-21 [1] CRAN (R 4.2.0)
 DBI           1.1.3      2022-06-18 [1] CRAN (R 4.2.0)
 digest        0.6.29     2021-12-01 [1] CRAN (R 4.2.0)
 dplyr         1.0.10     2022-09-01 [1] CRAN (R 4.2.0)
 ellipsis      0.3.2      2021-04-29 [1] CRAN (R 4.2.0)
 evaluate      0.16       2022-08-09 [1] CRAN (R 4.2.0)
 fansi         1.0.3      2022-03-24 [1] CRAN (R 4.2.0)
 fastmap       1.1.0      2021-01-25 [1] CRAN (R 4.2.0)
 generics      0.1.3      2022-07-05 [1] CRAN (R 4.2.0)
 ggplot2       3.3.6.9000 2022-09-05 [1] Github (tidyverse/ggplot2@a58b48c)
 glue          1.6.2      2022-02-24 [1] CRAN (R 4.2.0)
 gt            0.7.0      2022-08-25 [1] CRAN (R 4.2.0)
 gtable        0.3.1      2022-09-01 [1] CRAN (R 4.2.0)
 htmltools     0.5.3      2022-07-18 [1] CRAN (R 4.2.0)
 htmlwidgets   1.5.4      2021-09-08 [1] CRAN (R 4.2.0)
 jsonlite      1.8.0      2022-02-22 [1] CRAN (R 4.2.0)
 knitr         1.40       2022-08-24 [1] CRAN (R 4.2.0)
 lifecycle     1.0.2      2022-09-05 [1] Github (r-lib/lifecycle@f92faf7)
 magrittr      2.0.3      2022-03-30 [1] CRAN (R 4.2.0)
 munsell       0.5.0      2018-06-12 [1] CRAN (R 4.2.0)
 pillar        1.8.1      2022-08-19 [1] CRAN (R 4.2.0)
 pkgconfig     2.0.3      2019-09-22 [1] CRAN (R 4.2.0)
 purrr         0.3.4      2020-04-17 [1] CRAN (R 4.2.0)
 R6            2.5.1      2021-08-19 [1] CRAN (R 4.2.0)
 readxl        1.4.1      2022-08-17 [1] CRAN (R 4.2.0)
 rlang         1.0.5      2022-08-31 [1] CRAN (R 4.2.0)
 rmarkdown     2.16       2022-08-24 [1] CRAN (R 4.2.0)
 rstudioapi    0.14       2022-08-22 [1] CRAN (R 4.2.0)
 sass          0.4.2      2022-07-16 [1] CRAN (R 4.2.0)
 scales        1.2.1      2022-08-20 [1] CRAN (R 4.2.0)
 sessioninfo   1.2.2      2021-12-06 [1] CRAN (R 4.2.0)
 stringi       1.7.8      2022-07-11 [1] CRAN (R 4.2.0)
 stringr       1.4.1      2022-08-20 [1] CRAN (R 4.2.0)
 tibble        3.1.8      2022-07-22 [1] CRAN (R 4.2.0)
 tidyselect    1.1.2      2022-02-21 [1] CRAN (R 4.2.0)
 utf8          1.2.2      2021-07-24 [1] CRAN (R 4.2.0)
 vctrs         0.4.1      2022-04-13 [1] CRAN (R 4.2.0)
 xfun          0.32       2022-08-10 [1] CRAN (R 4.2.0)
 yaml          2.3.5      2022-02-21 [1] CRAN (R 4.2.0)

 [1] /Users/sebastiansaueruser/Rlibs
 [2] /Library/Frameworks/R.framework/Versions/4.2/Resources/library

──────────────────────────────────────────────────────────────────────────────
```
:::
:::
