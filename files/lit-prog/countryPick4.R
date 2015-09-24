## Required Libraries 
library(ggplot2)

## Data
gapMinder <- read.delim("gapminderDataFiveYear.tsv") 

### Check data 
head(gapMinder) #First 10 lines of dataset
dim(gapMinder) #number of rows and columns in data set

levels(gapMinder$country)

### Pick Four Countries
countryName1 <- "India"
countryName2 <- "United States"
countryName3 <- "Nigeria"
countryName4 <- "Germany"

### Country One
country1 <- subset(gapMinder, country == countryName1)

ggplot(country1, aes(year, pop)) + 
  geom_path() +
  ggtitle(countryName1) +
  theme(plot.title = element_text(size = 15, face = "bold")) 

ggplot(country1, aes(gdpPercap, lifeExp, size = pop)) + 
  geom_point() +
  ggtitle(countryName1) +
  theme(plot.title = element_text(size = 15, face = "bold"))

### Country Two
country2 <- subset(gapMinder, country == countryName2)

ggplot(country2, aes(year, pop)) + 
  geom_path() +
  ggtitle(countryName2) +
  theme(plot.title = element_text(size = 15, face = "bold"))

ggplot(country2, aes(gdpPercap, lifeExp, size = pop)) + 
  geom_point() +
  ggtitle(countryName2) +
  theme(plot.title = element_text(size = 15, face = "bold"))

### Country Three
country3 <- subset(gapMinder, country == countryName3)

ggplot(country3, aes(year, pop)) + 
  geom_path() +
  ggtitle(countryName3) +
  theme(plot.title = element_text(size = 15, face = "bold"))

ggplot(country3, aes(gdpPercap, lifeExp, size = pop, label = year)) + 
  geom_point() +
  geom_text(hjust = 1.3, vjust = 0, size = 3) +
  ggtitle(countryName3) +
  theme(plot.title = element_text(size = 15, face = "bold"))

### Country Four
country4 <- subset(gapMinder, country == countryName4)

ggplot(country4, aes(year, pop)) + 
  geom_path() +
  ggtitle(countryName4) +
  theme(plot.title = element_text(size=15, face = "bold"))

ggplot(country4, aes(gdpPercap, lifeExp, size = pop, color = year)) + 
  geom_point() +
  ggtitle(countryName4) +
  theme(plot.title = element_text(size=15, face = "bold"))

# All four countries

# Add subsetted data together
allCountries <- rbind(country1, country2, country3, country4)

ggplot(allCountries, aes(year, pop, color=country)) + 
  geom_path() +
  xlab("Year") + ylab("Population Size") +
  ggtitle("All four countries") +
  theme(plot.title = element_text(lineheight=.8, face = "bold"))

# what is occuring in a particular year?

yr <- 2007
ggplot(subset(allCountries, year == yr),
       aes(x = gdpPercap, y = lifeExp, color = country, size = pop)) + 
  scale_x_log10(limits = c(500, 90000)) + 
  geom_point(alpha = 0.8) + 
  scale_size_area(max_size = 14) +
  theme_bw() + # black grid on white background
  xlab("GDP per capita") + ylab("Life Expectancy") +
  ggtitle(paste("All 4 countries in", yr)) +
  theme(plot.title = element_text(size = 15, face = "bold"))

# plot all the years at once also:
ggplot(allCountries,
       aes(x = gdpPercap, y = lifeExp, color = country, size = pop)) + 
  scale_x_log10(limits = c(500, 90000)) +
  ylim(c(30, 90)) +
  geom_point(alpha = 0.8) + 
  scale_size_area(max_size = 14) +
  theme_bw() +  # black grid on white background
  xlab("GDP per capita") + ylab("Life Expectancy") +
  ggtitle("All 4 countries") +
  theme(plot.title = element_text(size = 15, face = "bold"))
