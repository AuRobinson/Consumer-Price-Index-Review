# Consumer Price Index Review

## BLUF

This project loads the monthly Consumer Price Index (CPI) data from the Bureau of Labor Statistics (BAL).

## Story

This was a quick project I put together after a few talks with some friends about the housing market and how eggs are [expensive](https://www.bls.gov/news.release/pdf/cpi.pdf). I wanted to see for myself what I could find.

## Source Details

- URL: https://data.bls.gov/cgi-bin/surveymost?bls
- CPI for All Urban Consumers (CPI-U)
- Series ID:    CUUR0000SA0

## Code

[R code](https://github.com/AuRobinson/Austin_Portfolio/blob/main/project_cpi_series.R)

## Visual

<img src= "https://github.com/AuRobinson/Austin_Portfolio/blob/main/cpi_line_combo.png" width=75% height=75%>

## Insights

Based on the yearly averages, we can observe a significant increase from 2020 to 2022, with the average rising from 258.8 to 292.65, a 33.85 point or approximately 13.1% increase. This increase is even more substantial than what was experienced during the 2008-2009 period.

For reference, the table below provides the mean CPI values year-over-year for the years 2017-2023:

| Year | Mean CPI Value |
| ---: | ---: |
| 2017  | 245.1196 |
| 2018  | 251.1068 |
| 2019  | 255.6574 |
| 2020  | 258.8112 |
| 2021  | 270.9698 |
| 2022  | 292.6549 |
| 2023  | 299.1700 |

_As an author's note, it may be worth exploring the use of ratios rather than the mean percentage differences to better capture the year-over-year changes._
<!-- _Further exploration based on this [post](https://www.linkedin.com/in/aurobinson/recent-activity/shares/)._ -->
