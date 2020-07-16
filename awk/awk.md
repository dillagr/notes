## Some AWK Notes


#### Count number of "fields" by the number of delimiter (or separator) instances from FILENAME
this code prints the line number (NR) and number of occurrences of the pipe(|) separator

`awk -F \| '{print NR,NF-1}' < FILENAME`


#### Comparison based on the second field ($2), using whitespace delimiter from FILENAME
this code is comparing the second field if it is equal to "84", with whitespace used as delimiter

`awk -F ' ' '$2 != 84' < FILENAME`

this one compares the value of the first field to the second field, using whitespace delimiter from FILENAME

`awk -F ' ' '$1 != $2' < FILENAME`


#### Pack/Unpack consecutive lines of a file with a delimiter
this code "packs" consecutive lines with a delimiter (in this case a semi-colon)

`cat data.txt | awk '{if (t % 2) printf "%s\n", $0; else printf "%s;", $0; t++}' > output.txt`

then this code "unpacks" the above output

`cat output.txt | awk -F';' '{ printf "%s\n%s\n", $1, $2}'`
