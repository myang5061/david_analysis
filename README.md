# david_analysis

convert ENTREZ_ID to SYMBOL_ID
FuncAnnotChart FuncAnnotClust FuncAnnotTable 

R script for the DAVID Bioinformatics analysis. This project is based on the string-db API. The input data are the Multiple Proteins by Sequences, and you can get the enrichment analysis from the string-db.

You can put multiple input files in the input folder and get the results for each one.

modified input and output path in script:
input='/path'

string_db_output='/stringdb/output'

run the script:
chmod u+x string-db.sh

./string-db.sh
