from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession.builder.appName("Day3_Filtering").getOrCreate()

data = [
    (1, "Ravi", 25000, "Hyderabad", 24),
    (2, "Priya", 30000, "Chennai", 26),
    (3, "Kiran", 35000, "Bangalore", 28),
    (4, "Sneha", 40000, "Mumbai", 23),
    (5, "Arjun", 45000, "Pune", 30),
    (6, "Suresh", 50000, "Hyderabad", 27)
]

columns = ["emp_id", "emp_name", "salary", "city", "age"]

df = spark.createDataFrame(data, columns)

print("Original Data")
df.show()

print("Salary > 35000")
df.filter(col("salary") > 35000).show()

print("Age > 25")
df.where(col("age") > 25).show()

print("Names Starting With S")
df.filter(col("emp_name").like("S%")).show()

print("City Hyderabad or Chennai")
df.filter(col("city").isin("Hyderabad", "Chennai")).show()

print("Age Between 24 and 28")
df.filter(col("age").between(24, 28)).show()
