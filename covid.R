plot_deaths <- function(values, colour) {
  lines(months, values, lwd = 3, col = colour)
}

data <- read.csv("data.csv")

years <- c(2018, 2019, 2020)

population <- c(66270000, 66650000, 67890000)
names(population) <- years
months <- factor(month.abb, levels = month.abb)

y18 <- data$X2018 / population[["2018"]] * 100000
y19 <- data$X2019 / population[["2019"]] * 100000
y20 <- data$X2020 / population[["2020"]] * 100000

min_month = min(c(y18, y19, y20))
max_month = max(c(y18, y19, y20))
plot(months, replicate(12, 0),
     ylim = c(min_month, max_month),
     xlab = "Month",
     ylab = "Deaths per 100,000 people")

plot_deaths(y18, "blue")
plot_deaths(y19, "purple")
plot_deaths(y20, "red")

legend( "topright",
        as.character(years),
        text.col=c("blue", "purple", "red"))
