#! bin/bash 

#create home folder for any data

hadoop fs -mkdir /data

#Create random data for terasort

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar teragen 5242880 /data/random-data 

#Now run terasort on the data you generated which will sort the data

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar terasort /data/random-data /data/sorted-data

#We cant measure the input and output IO speeds with TestDFSIO 

#----- TestDFSIO ----- : write

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-*-tests.jar TestDFSIO -write -nrFiles 10 -fileSize 5MB

#----- TestDFSIO ----- : read

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-*-tests.jar TestDFSIO -read -nrFiles 10 -fileSize 5MB

#The results are written to TestDFSIO_results.log 


cat $HADOOP_HOME/TestDFSIO_results.log 


