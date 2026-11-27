
# Web Scraping in R

# Install and load package
install.packages("rvest")
library(rvest)

# Read webpage
url <- "https://en.wikipedia.org/wiki/Data_science"
page <- read_html(url)

# Extract headings
headings <- page %>%
  html_elements("h2") %>%
  html_text2()

print(headings)

# Extract paragraphs
paragraphs <- page %>%
  html_elements("p") %>%
  html_text2()

print(paragraphs)

# Extract links
links <- page %>%
  html_elements("a") %>%
  html_attr("href")

print(links)

# Extract tables
tables <- page %>%
  html_elements("table")

if (length(tables) > 0) {
  result <- html_table(tables[[1]], fill=TRUE)
  print(result)
}

# Save extracted data
write.csv(data.frame(Paragraph=paragraphs),
          "scraped_data.csv",
          row.names=FALSE)
