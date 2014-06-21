# Smartphone Activity Data Set

The data was read from `X_train.txt` and `X_test.txt`, and combined with activity labels and subject test ids provided by the corresponding `y_*` and `subject_*` files. The data contained a number of different metrics on different measurements, and we extracted only the "mean value" and "standard deviation" metrics for each measurement.

- Each row in the tidy set corresponds to a combination of an individual, identified by their id (30 individuals), and an activity label, out of a possible 6 labels (walking, walking\_up, walking\_down, sitting, standing, laying). A total of 180 rows.
- The remaining columns correspond to a combination of a type of measurement and metric (mean/std).
- A prefix in the column name (time/freq) indicates whether that measurement is measured in the time domain or the frequency domain.
- The tidy set `tidySet.txt` is in a simple text format, where columns are separated by spaces. There are a total of 81 columns. The first row of the set contains the column names.
