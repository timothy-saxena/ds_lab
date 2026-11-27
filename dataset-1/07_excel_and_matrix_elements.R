# Question 7: Write/read an Excel workbook and inspect matrix elements.
# Install once if needed: install.packages(c("readxl", "writexl"))
if (!requireNamespace("writexl", quietly = TRUE) || !requireNamespace("readxl", quietly = TRUE)) {
  stop("Install the readxl and writexl packages first.")
}

marks <- data.frame(name = c("Asha", "Bilal", "Chitra"), score = c(86, 74, 93))
writexl::write_xlsx(list(Marks = marks, Notes = data.frame(note = "Sample workbook")), "student_marks.xlsx")
excel_data <- readxl::read_excel("student_marks.xlsx", sheet = "Marks")
print(excel_data)
writexl::write_xlsx(list(Marks = as.data.frame(excel_data)), "student_marks_copy.xlsx")

M <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
cat("Matrix:\n"); print(M)
cat("Dimensions: "); print(dim(M))
cat("Rows: ", nrow(M), "; columns: ", ncol(M), "; elements: ", length(M), "\n", sep = "")
cat("Element at row 2, column 3: ", M[2, 3], "\n", sep = "")
cat("Second row: "); print(M[2, ])
cat("Columns 1 and 4: \n"); print(M[, c(1, 4), drop = FALSE])
cat("Elements 2, 5, and 8 in column-major order: "); print(M[c(2, 5, 8)])
