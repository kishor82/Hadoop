book = LOAD 'hdfs:/data/small/war_and_peace.txt' USING PigStorage() AS (lines:chararray);
words = FOREACH book  GENERATE FLATTEN(TOKENIZE(lines)) as word;
wordsGrouped = GROUP words BY word;
wordsAggregated =  FOREACH wordsGrouped GENERATE group as word, COUNT(words);
wordsSorted = ORDER wordsAggregated BY $1 DESC;
STORE wordsSorted INTO 'hdfs:/data/small/pigresults';