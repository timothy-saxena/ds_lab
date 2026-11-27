# Question 8: Read values from XML and create named arrays.
# Install once if needed: install.packages("xml2")
if (!requireNamespace("xml2", quietly = TRUE)) stop("Install the xml2 package first.")

xml_text <- '<class><student id="1"><name>Asha</name><grade>A</grade></student><student id="2"><name>Bilal</name><grade>B</grade></student></class>'
writeLines(xml_text, "class.xml")
doc <- xml2::read_xml("class.xml")
student_names <- xml2::xml_text(xml2::xml_find_all(doc, ".//student/name"))
student_grades <- xml2::xml_text(xml2::xml_find_all(doc, ".//student/grade"))
print(data.frame(name = student_names, grade = student_grades))

# Column-wise filling is R's default; transpose the input first for row-wise filling.
column_array <- array(1:12, dim = c(2, 3, 2))
row_array <- array(as.vector(t(matrix(1:12, nrow = 2, byrow = TRUE))), dim = c(2, 3, 2))
names_dim <- list(row = c("R1", "R2"), column = c("C1", "C2", "C3"), slice = c("S1", "S2"))
dimnames(column_array) <- names_dim
dimnames(row_array) <- names_dim
cat("Column-wise array:\n"); print(column_array)
cat("Row-wise array:\n"); print(row_array)
cat("Array addition:\n"); print(column_array + row_array)
cat("Array subtraction:\n"); print(column_array - row_array)
