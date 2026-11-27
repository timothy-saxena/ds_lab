# Question 6: Text-file input/output and common vector operations.
lines_to_save <- c("Data Science Lab", "R can read and write text files.", "Vector operations are useful.")
writeLines(lines_to_save, "lab_notes.txt")
notes <- readLines("lab_notes.txt", warn = FALSE)
cat("Text read from file:\n"); cat(notes, sep = "\n")
writeLines(c(notes, "This is an added line."), "lab_notes_copy.txt")

x <- c(10, 20, 30, 40, 50)
target <- 30
cat("Is target present? ", target %in% x, "\n", sep = "")
cat("First element: ", x[1], "\n", sep = "")
cat("Elements at positions 2 and 4: "); print(x[c(2, 4)])
cat("Elements greater than 25: "); print(x[x > 25])
cat("x + 5: "); print(x + 5)
cat("x * 2: "); print(x * 2)
cat("x / 10: "); print(x / 10)
