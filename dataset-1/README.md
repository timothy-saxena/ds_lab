# Data Science Lab Solutions

This folder contains R scripts for the 15 questions included from **DS Sample Lab Questions - Formatted.pdf**.

## Included questions

| Question | File | Main topic |
|---|---|---|
| 1 | `01_prime_number_check.R` | Prime number check |
| 2 | `02_employee_dataframe.R` | Data frame, structure, summary, scatter plot |
| 3 | `03_patient_vectors_matrices.R` | Vectors and matrix operations |
| 4 | `04_student_dataframe_charts.R` | Student data frame, filtering, grouping, charts |
| 5 | `05_csv_read_write_plots.R` | CSV input/output, scatter plot, box plot |
| 6 | `06_text_file_vector_operations.R` | Text files and vector operations |
| 7 | `07_excel_and_matrix_elements.R` | Excel input/output and matrix indexing |
| 8 | `08_xml_read_and_arrays.R` | XML input and named array operations |
| 9 | `09_calculator_and_dataset_functions.R` | Calculator, data frame functions, graph |
| 10 | `10_even_odd_and_xml_data.R` | Even/odd numbers and XML retrieval |
| 11 | `11_factors_and_type_operations.R` | Factors, type conversion, IQR |
| 14 | `14_xml_data_retrieval.R` | Retrieve a selected value from XML |
| 16 | `16_student_scores_dataframe.R` | Filtering, grading, sorting, row/column binding |
| 17 | `17_numeric_vectors_type_coercion.R` | Numeric vectors, coercion, sequence operations |
| 20 | `20_array_operations.R` | Row-wise/column-wise arrays and arithmetic |

Questions excluded as requested: regression questions (15, 18, 19), KNN (12), K-means (24), Naive Bayes (13, 23), ANOVA/correlation/covariance (21), and web scraping (22).

## Running the scripts

Run a script from R or RStudio. The CSV and text examples create their sample input/output files in the current working directory. The XML examples create a small XML file before reading it. The Excel example requires `readxl` and `writexl`; install them once with `install.packages(c("readxl", "writexl"))`. XML examples require `xml2`; install it with `install.packages("xml2")`.

Most scripts use only base R. Comments in each script identify the steps and the sample data used.
