
# What is HBase

Hbase is an open source and sorted map data built on Hadoop. It is column oriented and horizontally scalable.

It is based on Google's Big Table.It has set of tables which keep data in key value format. Hbase is well suited for sparse data sets which are very common in big data use cases. Hbase provides APIs enabling development in practically any programming language. It is a part of the Hadoop ecosystem that provides random real-time read/write access to data in the Hadoop File System.

![hbase](https://www.javatpoint.com/hadooppages/images/rdbms_vs_hbase.PNG)

## Why HBase

RDBMS get exponentially slow as the data becomes large
Expects data to be highly structured, i.e. ability to fit in a well-defined schema
Any change in schema might require a downtime
For sparse datasets, too much of overhead of maintaining NULL values

## Installation

Download a stable release from an Apache Download Mirror and unpack it on your
local filesystem. And move to /usr/local/hbase.For example:

`tar xzf hbase-x.y.z.tar.gz`

`sudo mv hbase-x.y.z.tar.gz /usr/local/hbase`


As with Hadoop, you first need to tell HBase where Java is located on your system. If
you have the JAVA_HOME environment variable set to point to a suitable Java installation,
then that will be used, and you don’t have to configure anything further. Otherwise,
you can set the Java installation that HBase uses by editing HBase’s conf/hbase-env.sh
and specifying the JAVA_HOME variable

##Add the HBase binary directory to your command-line path. 

`export HBASE_HOME=/usr/local/hbase`

`export PATH=$PATH:$HBASE_HOME/bin`

## Test Drive

To start a temporary instance of HBase that uses the /tmp directory on the local file-
system for persistence, type:

`start-hbase.sh`

This will launch a standalone HBase instance that persists to the local filesystem; by
default, HBase will write to /tmp/hbase-${USERID}.


To administer your HBase instance, launch the HBase shell by typing:

`hbase shell`

## Create Table 

To create a table named test with a single column family named data using defaults
for table and column family attributes, enter:

`create 'htest', 'cf'`

To prove the new table was created successfully, run the list command. This will
output all tables in user space:

`list`

## Insert data 

To insert data into three different rows and columns in the data column family, and
then list the table content, do the following:

`put 'htest','r1','cf:c1','v1'`

`put 'htest','r2','cf:c2','v2'`

`put 'htest','r3','cf:c3','v3'`  	

`scan 'htest'`

## Retrive Specific row

`get 'htest' , 'r2'`

## Update Specific row

`put 'htest','r2','cf:c2','v2updated'`

`get 'htest','r2'`

## Delete Specific row

`delete 'htest' ,'r3','cf:c3'`

`scan 'htest'`

## Remove Table

To remove the table, you must first disable it before dropping it:

`disable 'htest'`

`drop 'htest`


* Shut down your HBase instance by running:

`stop-hbase.sh`

