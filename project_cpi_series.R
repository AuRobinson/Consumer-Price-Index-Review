library(data.table)
library(plotly)

cpi_table <- fread("~/FILE PATH/CPI_SeriesReport.txt") # Maybe use BLS' API one of these days
cpi_table_long <- melt(cpi_table, id.vars = "Year", variable.name = "Month", value.name = "CPI", na.rm = TRUE) # Wide to Long transformation
month_table <- data.table(index = c(1:12), month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")) # Month table because I'm lazy

cpi_table_long <- cpi_table_long[month_table, on = .(Month = month)] # Index the month table for setorder()... plot_ly() does not like unordered data
cpi_table_long[, Date := as.Date(paste0(Year, "-", index, "-01", origin = "1970-01-01"))] # Define the date
setorder(cpi_table_long, Date) # Order above chaos
cpi_table_long[, Difference := c(NA, diff(CPI))] # Find month over month difference (first obs. is NA)

# Plot 1: Combo with `Difference` on right-y-axis by date
plot_ly(data = cpi_table_long[Year >= 1900], x = ~ Date, y = ~ CPI, name = "CPI", type = "scatter", mode = "lines") |>
 add_trace( y = ~ Difference, alpha = 0.5, name = "Difference", type = "scatter", mode = "lines", yaxis = "y2") |>
 layout(yaxis2 = list(title = "Difference", overlaying = "y", side = "right"))

# Plot 2: Box with `Difference` to see volatility over time
plot_ly(data = cpi_table_long[], x = ~ Year, y = ~ Difference, type = 'box')
