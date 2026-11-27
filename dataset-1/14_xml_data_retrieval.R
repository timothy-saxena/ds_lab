# Question 14: Read an XML file and retrieve one selected record/value.
# Install once if needed: install.packages("xml2")
if (!requireNamespace("xml2", quietly = TRUE)) stop("Install the xml2 package first.")

xml_text <- '<library><book id="B101"><title>Data Science Basics</title><author>R. Kumar</author></book><book id="B102"><title>Learning R</title><author>S. Rao</author></book></library>'
writeLines(xml_text, "library.xml")
doc <- xml2::read_xml("library.xml")
book_id <- "B102"
book <- xml2::xml_find_first(doc, sprintf(".//book[@id='%s']", book_id))
if (inherits(book, "xml_missing")) stop("Book ID was not found.")
book_details <- data.frame(
  id = xml2::xml_attr(book, "id"),
  title = xml2::xml_text(xml2::xml_find_first(book, "./title")),
  author = xml2::xml_text(xml2::xml_find_first(book, "./author"))
)
print(book_details)
