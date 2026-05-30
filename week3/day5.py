from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession.builder.appName("Day5_Select_Alias_Rename").getOrCreate()

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
# SELECT QUESTIONS
# ==================================================

df.select("emp_name", "salary").show()

df.select("emp_id", "emp_name", "department").show()

df.select("city", "designation", "salary").show()

df.filter(col("department") == "IT") \
    .select("emp_name", "salary", "city") \
    .show()

df.select("emp_name", "joining_date", "salary").show()

df.select(
    "emp_id",
    "emp_name",
    "age",
    "city",
    "designation"
).show()

df.select("salary").show()

df.filter(col("city") == "Hyderabad") \
    .select("emp_name", "city") \
    .show()

df.select("designation", "department").show()

df.drop("joining_date").show()

# ==================================================
# ALIAS QUESTIONS
# ==================================================

df.select(
    col("emp_name").alias("employee_name")
).show()

df.select(
    col("salary").alias("monthly_salary")
).show()

df.select(
    col("department").alias("dept")
).show()

df.select(
    col("joining_date").alias("doj")
).show()

df.select(
    col("emp_name").alias("name"),
    col("city").alias("location")
).show()

df.select(
    col("designation").alias("job_role")
).show()

df.select(
    col("age").alias("employee_age")
).show()

df.select(
    col("emp_name").alias("employee_name"),
    col("salary").alias("emp_salary"),
    col("department").alias("emp_department")
).show()

df.select(
    col("salary").alias("emp_salary"),
    col("department").alias("emp_dept")
).show()

df.select(
    col("city").alias("work_location")
).show()

# ==================================================
# WITHCOLUMNRENAMED QUESTIONS
# ==================================================

df.withColumnRenamed(
    "emp_name",
    "employee_name"
).show()

df.withColumnRenamed(
    "department",
    "dept"
).show()

df.withColumnRenamed(
    "joining_date",
    "doj"
).show()

df.withColumnRenamed(
    "salary",
    "monthly_salary"
).show()

df.withColumnRenamed(
    "designation",
    "job_role"
).show()

df.withColumnRenamed(
    "city",
    "work_location"
).show()

df.withColumnRenamed(
    "age",
    "employee_age"
).show()

df.withColumnRenamed(
    "emp_name",
    "employee_name"
).withColumnRenamed(
    "salary",
    "monthly_salary"
).show()

df.withColumnRenamed(
    "emp_id",
    "employee_id"
).show()

df.withColumnRenamed(
    "department",
    "business_unit"
).show()
