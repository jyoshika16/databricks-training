from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession.builder.appName("Day2_DataFrame_Operations").getOrCreate()

# Sample Employee Data
data = [
    (1, "Ravi", 25000, "Hyderabad"),
    (2, "Priya", 30000, "Chennai"),
    (3, "Kiran", 35000, "Bangalore"),
    (4, "Sneha", 40000, "Mumbai"),
    (5, "Arjun", 45000, "Pune")
]

columns = ["emp_id", "emp_name", "salary", "city"]

df = spark.createDataFrame(data, columns)

print("Original Data")
df.show()

# select()
print("Select Employee Name and Salary")
df.select("emp_name", "salary").show()

# alias()
print("Alias Example")
df.select(
    col("emp_name").alias("employee_name"),
    col("salary").alias("monthly_salary")
).show()

# withColumn()
print("Adding Bonus Column")
df_bonus = df.withColumn(
    "bonus",
    col("salary") * 0.10
)

df_bonus.show()

# withColumnRenamed()
print("Renaming Column")
df_renamed = df.withColumnRenamed(
    "emp_name",
    "employee_name"
)

df_renamed.show()
