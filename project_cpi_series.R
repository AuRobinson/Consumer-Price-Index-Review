library(data.table)
library(plotly)

# 1. Manual pull file from (https://data.bls.gov/cgi-bin/surveymost?bls)
# 2. Save file as .txt to working directory (use `getwd()` to find it.)
# 3. Replace file path in quotations for `data.table::fread()`

cpi_table <- data.table::fread("~/FILE PATH/CPI_SeriesReport.txt")

cpi_table_long[, Date := as.Date(paste0(Year, "-", index, "-01", origin = "1970-01-01"))] 
setorder(cpi_table_long, Date) # Order above chaos
cpi_table_long[, Difference := c(NA, diff(CPI))] # Find month over month difference (first obs. is NA)

# Wide to Long transformation
cpi_table_long <-
 melt(
  cpi_table,
  id.vars = "Year",
  variable.name = "Month",
  value.name = "CPI",
  na.rm = TRUE
 )

# Month table to join to `cpi_table_long` for simplicity
month_table <- data.table(
 index = c(1:12),
 month = c(
  "Jan", "Feb", "Mar", "Apr", "May","Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
 )
)

# Join `cpi_table_long` and `month_table`
cpi_table_long <- cpi_table_long[month_table, on = .(Month = month)]

# Define [Date] then setorder()... plot_ly() does not like unordered data for line plots
cpi_table_long[, Date := as.Date(paste0(Year, "-", index, "-01", origin = "1970-01-01"))]
setorder(cpi_table_long, Date)

# Define [Difference] to month-to-month-changes
cpi_table_long[, Difference := c(NA, diff(CPI))]

# Visuals ----

# Plot 1: Combo with `Difference` on right-y-axis by date
plot_ly(
 data = cpi_table_long[Year >= 1900],
 x = ~ Date,
 y = ~ CPI,
 name = "CPI (left)",
 type = "scatter",
 mode = "lines"
) |> 
 add_trace(
  y = ~ Difference,
  alpha = 0.5,
  name = "Difference (right)",
  type = "scatter",
  mode = "lines",
  yaxis = "y2"
 ) |>
 layout(yaxis2 = list(
  title = "Difference",
  overlaying = "y",
  side = "right"
 ))

# Plot 2: Box with `Difference` to see volatility over time
plot_ly(
 data = cpi_table_long,
 x = ~ Year,
 y = ~ Difference,
 type = 'box'
)
