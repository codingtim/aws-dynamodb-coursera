Week 1 

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html
managed nosql db
key/value db

table containing keys with attributes
partition key (unique)
partition with sort key (combination unique)

write multi AZ by default
read choose strong or eventual consistency 

max size is 400kb
partition min key length is 1byte max size 248byte

query: partition key has to be specified, sort key may be specified, optional filter can be applied
scan: loop all with optional filter 

Local secondary index: only different sort key
Global secondary index: different partition key
There is no query optimizer so you have to specify which index to query or scan

