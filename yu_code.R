library(tidyverse)

bmi_data <- read.csv("DAProject6.csv")

glimpse(bmi_data)
bmi_data <- bmi_data |>
  drop_na()
summary(bmi_data$BMI)
ggplot(bmi_data, aes(x = BMI)) +
  geom_histogram(binwidth = 1, fill = "blue", alpha = 0.5) +
  labs(title = "BMI distribution", x = "BMI", y = "frequency")

bmi_trend <- bmi_data |>
  group_by(Year) |>
  summarise(mean_BMI = mean(BMI, na.rm = TRUE))


ggplot(bmi_trend, aes(x = Year, y = mean_BMI)) +
  geom_line() +
  geom_point() +
  labs(title = "BMI with time", x = "year", y = "BMI average")

