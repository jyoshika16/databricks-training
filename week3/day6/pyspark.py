from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession.builder.appName("Day6_Filter_WithColumn_TypeCasting_Sort_Limit").getOrCreate()

# Employee Dataset
data = [
    (1, "Sravan", 25, "Hyderabad", "Data Engineer", 55000, "2023-01-15", "IT"),
    (2, "Ravi", 28, "Bangalore", "Software Engineer", 72000, "2022-11-10", "IT"),
    (3, "Priya", 24, "Chennai", "Analyst", 48000, "2023-03-12", "Analytics"),
    (4, "Kiran", 30, "Pune", "Manager", 85000, "2021-09-20", "Management"),
    (5, "Sneha", 27, "Mumbai", "HR", 45000, "2020-05-18", "HR")
]

columns = [
    "emp_id",
    "emp_name",
    "age",
    "city",
    "designation",
    "salary",
    "joining_date",
    "department"
]

df = spark.createDataFrame(data, columns)

print("Original Data")
df.show()

# ==================================================
# FILTER / WHERE QUESTIONS
# ==================================================

df.filter(col("salary") > 70000).show()

df.filter(col("city") == "Hyderabad").show()

df.filter(col("age") < 25).show()

df.filter(col("department") == "IT").show()

df.filter(col("designation") == "Developer").show()

df.filter(col("salary").between(50000, 80000)).show()

df.filter(col("city") == "Bangalore").show()

df.filter(col("joining_date") > "2022-01-01").show()

df.filter(col("age") > 30).show()

df.filter(col("salary") < 50000).show()

df.filter(
    (col("city") == "Chennai") &
    (col("salary") > 60000)
).show()

df.filter(
    (col("city") == "Mumbai") |
    (col("city") == "Pune")
).show()

df.filter(
    col("emp_name").like("S%")
).show()

df.filter(
    col("emp_name").like("%a")
).show()

df.filter(
    col("department") == "HR"
).show()

df.filter(
    col("designation").contains("Engineer")
).show()

df.filter(
    col("city") != "Hyderabad"
).show()

df.filter(
    col("age").between(25, 30)
).show()

df.filter(
    col("salary") > 90000
).show()

df.filter(
    col("department") == "Support"
).show()

# ==================================================
# WITHCOLUMN QUESTIONS
# ==================================================

df.withColumn(
    "bonus",
    col("salary") * 0.10
).show()

df.withColumn(
    "annual_salary",
    col("salary") * 12
).show()

df.withColumn(
    "tax",
    col("salary") * 0.05
).show()

df.withColumn(
    "updated_salary",
    col("salary") + 5000
).show()

df.withColumn(
    "salary_category",
    when(col("salary") >= 80000, "High")
    .when(col("salary") >= 50000, "Medium")
    .otherwise("Low")
).show()

df.withColumn(
    "age_group",
    when(col("age") < 25, "Young")
    .otherwise("Adult")
).show()

df.withColumn(
    "location",
    concat_ws("-", col("city"), col("department"))
).show()

df.withColumn(
    "increment_salary",
    col("salary") * 1.15
).show()

df.withColumn(
    "experience_status",
    when(year(to_date(col("joining_date"))) < 2022, "Experienced")
    .otherwise("New")
).show()

df.withColumn(
    "name_length",
    length(col("emp_name"))
).show()

df.withColumn(
    "is_high_salary",
    when(col("salary") > 70000, True)
    .otherwise(False)
).show()

df.withColumn(
    "joining_year",
    year(to_date(col("joining_date")))
).show()

df.withColumn(
    "salary_after_tax",
    col("salary") - (col("salary") * 0.05)
).show()

df.withColumn(
    "department_code",
    substring(col("department"), 1, 3)
).show()

df.withColumn(
    "double_salary",
    col("salary") * 2
).show()

# ==================================================
# TYPECASTING QUESTIONS
# ==================================================

df.withColumn(
    "salary_string",
    col("salary").cast("string")
).show()

df.withColumn(
    "age_double",
    col("age").cast("double")
).show()

df.withColumn(
    "joining_date_cast",
    col("joining_date").cast("date")
).show()

df.withColumn(
    "emp_id_string",
    col("emp_id").cast("string")
).show()

df.withColumn(
    "salary_integer",
    col("salary").cast("int")
).show()

df.withColumn(
    "age_string",
    col("age").cast("string")
).show()

df.withColumn(
    "joining_timestamp",
    col("joining_date").cast("timestamp")
).show()

df.withColumn(
    "salary_float",
    col("salary").cast("float")
).show()

df.withColumn(
    "emp_id_long",
    col("emp_id").cast("long")
).show()

df.select(
    col("salary").cast("string").alias("salary_string"),
    col("age").cast("double").alias("age_double")
).show()

# ==================================================
# SORT / ORDERBY QUESTIONS
# ==================================================

df.sort("salary").show()

df.orderBy(col("salary").desc()).show()

df.orderBy(col("age").desc()).show()

df.orderBy("emp_name").show()

df.orderBy(
    col("city"),
    col("salary").desc()
).show()

df.orderBy("joining_date").show()

df.orderBy("department").show()

df.orderBy(col("designation").desc()).show()

df.orderBy("city", "age").show()

df.orderBy(
    col("salary").desc()
).limit(10).show()

df.orderBy(
    col("emp_id").desc()
).show()

df.filter(
    col("department") == "IT"
).orderBy(
    col("salary").desc()
).show()

df.orderBy(
    col("joining_date").desc()
).show()

df.orderBy("emp_name").show()

df.orderBy(
    "department",
    col("salary").desc()
).show()

# ==================================================
# LIMIT QUESTIONS
# ==================================================

df.limit(5).show()

df.limit(10).show()

df.filter(
    col("department") == "IT"
).limit(3).show()

df.orderBy(
    col("salary").desc()
).limit(5).show()

df.orderBy(
    col("salary")
).limit(5).show()

df.orderBy(
    col("age")
).limit(7).show()

df.filter(
    col("city") == "Hyderabad"
).limit(2).show()

df.limit(15).show()

df.orderBy(
    col("age")
).limit(5).show()

df.filter(
    col("salary") > 60000
).limit(8).show()
