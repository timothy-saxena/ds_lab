# Question 10: Classify numbers as even/odd and retrieve a value from XML.
numbers <- c(12, 7, 20, 5, 9, 14, 3, 18)
even_numbers <- numbers[numbers %% 2 == 0]
odd_numbers <- numbers[numbers %% 2 != 0]
cat("Even numbers: "); print(even_numbers)
cat("Odd numbers: "); print(odd_numbers)
cat("Mean of even numbers:", mean(even_numbers), "\n")
cat("Sum of even numbers:", sum(even_numbers), "\n")
cat("Mean of odd numbers:", mean(odd_numbers), "\n")
cat("Sum of odd numbers:", sum(odd_numbers), "\n")

# Install once if needed: install.packages("xml2")
if (!requireNamespace("xml2", quietly = TRUE)) stop("Install the xml2 package first.")
xml_text <- '<inventory><item code="P01"><name>Notebook</name><price>45</price></item><item code="P02"><name>Pen</name><price>10</price></item></inventory>'
writeLines(xml_text, "inventory.xml")
doc <- xml2::read_xml("inventory.xml")
selected_price <- xml2::xml_text(xml2::xml_find_first(doc, ".//item[@code='P02']/price"))
cat("Price of item P02:", selected_price, "\n")
