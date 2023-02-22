# Austin's Portfolio

_Data Analyst / Data Science Portfolio_

## R Projects

### Consumer Price Index Review

#### BLUF

This project loads the monthly Consumer Price Index (CPI) data from the Bureau of Labor Statistics (BAL).

#### Story

This was a quick project I put together after a few talks with some friends about the housing market and how eggs are [expensive](https://www.bls.gov/news.release/pdf/cpi.pdf). I wanted to see for myself what I could find.

#### Source Details

- URL: https://data.bls.gov/cgi-bin/surveymost?bls
- CPI for All Urban Consumers (CPI-U)
- Series ID:    CUUR0000SA0

#### Code

[R code](https://github.com/AuRobinson/Austin_Portfolio/blob/main/project_cpi_series.R)

#### Visual

<img src= "https://github.com/AuRobinson/Austin_Portfolio/blob/main/cpi_line_combo.png" width=75% height=75%>

#### Insights

Just looking at the yearly averages, from 2020 to 2022 we went from an average of 258.8 to 292.65; 33.85 point increase (~13.1%). Not even 2008 - 2009 was that drastic.

| Year | cpi_mean_year |
| ---: | ---: |
| 2017  | 245.1196 |
| 2018  | 251.1068 |
| 2019  | 255.6574 |
| 2020  | 258.8112 |
| 2021  | 270.9698 |
| 2022  | 292.6549 |
| 2023  | 299.1700 |

### Notes from the Author
- I've noticed some sites are taking the mean of the % differences rather than using ratios to better fit the differences year over year; need to explore further (2023-02-21)
