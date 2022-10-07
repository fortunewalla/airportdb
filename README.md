# airportdb

### Objectives

To learn MySQL, SQL & data analysis through the airportdb database.

### Introduction

We used the http://flughafendb.cc/ airport database (small) and modified it to convert most of the fields to English. 

This database is of interest for the following reasons:

1. It is a newly added database to the MySQL sample databases. https://dev.mysql.com/doc/airportdb/en/

2. It is one of the datasets that works with the Oracle HeatWave Analytics Engine: https://dev.mysql.com/doc/heatwave/en/heatwave-quickstarts.html 

3. It can be used to demonstrate analytics through HeatWave: https://dev.mysql.com/doc/heatwave/en/airportdb-quickstart.html

Demo Video: https://www.youtube.com/watch?v=ppolVUzOBSQ

4. A similar `airlines` dataset can also be used to work on HeatWave ML: https://dev.mysql.com/doc/heatwave/en/heatwave-machine-learning.html

| Benchmark       | Explanation           | #Rows (Training Set) | #Features |
| --------------- | --------------------- | -------------------- | --------- |
| airlines        | Predict Flight Delays | 377568               | 8         |

CSV download link: https://www.openml.org/data/get_csv/66526/phpvcoG8S

Python script to generate train and test CSV: https://github.com/oracle-samples/heatwave-ml/blob/main/heatwave-ml/preprocess.py

SQL to load data, run model, create score:  https://github.com/oracle-samples/heatwave-ml/blob/main/heatwave-ml/airlines.sql

### NOTE

This database is available in different sizes and forms depending on what source you download from. 

In the official MySQL website: It is a ~640MB size .ZIP file: https://downloads.mysql.com/docs/airport-db.zip

We use a much smaller version ~97MB from the source: https://github.com/stefanproell/flughafendb/tree/master/mysql-shell-dumps/flughafendb_small

```shell
$ git push                                                                             
Enumerating objects: 66, done.                                                         
Counting objects: 100% (66/66), done.                                                  
Delta compression using up to 8 threads                                                
Compressing objects: 100% (54/54), done.                                               
Writing objects: 100% (65/65), 143.92 MiB | 111.39 MiB/s, done.                        
Total 65 (delta 34), reused 0 (delta 0), pack-reused 0                                 
remote: Resolving deltas: 100% (34/34), done.                                          
remote: warning: See http://git.io/iEPt8g for more information.                        
remote: warning: File db/ffdb_data.sql.gz is 96.73 MB; this is larger than GitHub's recommended maximum file size of 50.00 MB                                                 
remote: warning: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.                                                        
To https://github.com/fortunewalla/airportdb.git                                       
   fb1420b..829611c  main -> main                                                      
```

This was modified from the source in the following ways.

a) It was renamed to `ffdb` as an acknowledgement to the original German name of `flughafendb`

b) The `weatherdata` table, `weather` German fields were converted to English

c) The `employee` table, `department` German fields were converted to English

d) The `passengerdetails` table, `sex` German fields were converted to English i.e. from `w` to `f` 

e) The `airline` table, `airlinename` fields were expanded them to the correct names from the uncorrected 20 chars truncated version. 

### Installation

For complete installation instructions, please refer to http://flughafendb.cc

There are two ways to install. The file paths are written assuming you are in the `db` directory.

1. Using `mysql`

`gunzip ffdb_data.sql.gz`

`mysql -u <username> -p <password> < ffdb_schema.sql`

`mysql -u <username> -p <password> ffdb < ffdb_data.sql`

The process should take up to 20 hours depending on your machine setup!

Sometimes, if mysql information schema doesn't register the new tables properly. Please run the command to update `information_schema` with the new tables information.

`analyze table <each table name>;`

2. Using `mysqlsh` (Recommended Method)

`mysqlsh -u <username> -p <password>`

Once inside the `mysqlsh` shell:

`util.loadDump("./ffdb", {threads: 4})`

This should take much less time to install than the `mysql` commands.

This is all the setup we need for now. Henceforth, we will start exploring the database.

### 

