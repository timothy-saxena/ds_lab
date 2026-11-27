# Question 20: Create row-wise and column-wise arrays, name dimensions, and operate.
column_array <- array(1:12, dim = c(2, 3, 2))
row_array <- array(as.vector(t(matrix(1:12, nrow = 2, byrow = TRUE))), dim = c(2, 3, 2))
dimension_names <- list(
  row = c("Row1", "Row2"),
  column = c("Col1", "Col2", "Col3"),
  layer = c("Layer1", "Layer2")
)
dimnames(column_array) <- dimension_names
dimnames(row_array) <- dimension_names

cat("Filled column-wise (R default):\n"); print(column_array)
cat("Filled row-wise:\n"); print(row_array)
cat("Addition:\n"); print(column_array + row_array)
cat("Subtraction:\n"); print(column_array - row_array)
cat("Element-wise multiplication:\n"); print(column_array * row_array)
cat("Element-wise division:\n"); print(column_array / row_array)
