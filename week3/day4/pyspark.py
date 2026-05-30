from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession.builder.appName("Day4_Sorting").getOrCreate()

data = [
    (1, "Ravi", 25000),
    (2, "Priya", 30000),
    (3, "Kiran", 35000),
    (4, "Sneha", 40000),
    (5, "Arjun", 45000)
]

columns = ["emp_id", "emp_name", "salary"]

df = spark.createDataFrame(data, columns)

print("Original Data")
df.show()

print("Salary Ascending")
df.sort("salary").show()

print("Salary Descending")
df.orderBy(col("salary").desc()).show()

print("Top 3 Records")
df.limit(3).show()
