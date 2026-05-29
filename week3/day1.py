from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession.builder.appName("PySpark Learning").getOrCreate()

# Create Sample DataFrame

data = [
    (1, "Ravi", 25000),
    (2, "Priya", 30000),
    (3, "Kiran", 35000)
]

columns = ["id", "name", "salary"]

df = spark.createDataFrame(data, columns)

print("Original Data")
df.show()

print("Schema")
df.printSchema()

print("Select Name")
df.select("name").show()

print("Select Name and Salary")
df.select("name", "salary").show()
