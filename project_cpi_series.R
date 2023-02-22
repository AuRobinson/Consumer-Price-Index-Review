library(data.table)
library(plotly)

cpi_table <- fread("~/CPI_SeriesReport.txt") # "~/Home Directory/.../File.csv"
cpi_table_long <- melt(cpi_table, id.vars = "Year", variable.name = "Month", value.name = "CPI", na.rm = TRUE)
month_table <- data.table(index = c(1:12), month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

cpi_table_long <- cpi_table_long[month_table, on = .(Month = month)]
cpi_table_long[, Date := as.Date(paste0(Year, "-", index, "-01", origin = "1970-01-01"))]
setorder(cpi_table_long, Date)
cpi_table_long[, Difference := c(NA, diff(CPI))]

plot_ly(data = cpi_table_long[Year >= 1900], x = ~ Date, y = ~ CPI, name = "CPI", type = "scatter", mode = "lines") |>
 add_trace( y = ~ Difference, alpha = 0.5, name = "Difference", type = "scatter", mode = "lines", yaxis = "y2") |>
 layout(yaxis2 = list(title = "Difference", overlaying = "y", side = "right"))

plot_ly(data = cpi_table_long[], x = ~ Year, y = ~ Difference, type = 'box')
