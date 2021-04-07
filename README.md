# david_analysis
R script for the DAVID Bioinformatics analysis. This project is based on the RDAVIDWebService and org.Hs.eg.db. The input data are the Multiple Proteins by Sequences. Since David is temporarily not support OFFICAL SYMBOL ID on RDAVIDWebService, so the SYMBOL_ID have to convert to ENTREZ_ID.Aand you can get the FuncAnnotChart FuncAnnotClust FuncAnnotTable analysis from the DAVID Bioinformatics analysis API.

You can find detailed information on https://david.ncifcrf.gov/content.jsp?file=DAVID_API.html

## steps
1.register your email address on https://david.ncifcrf.gov/webservice/register.htm

2.replace email address with your registered address, modified input and output path in script:

      setwd("/path/")
  
      email='your email address'
  
      FuncAnnotChart_names <- paste("/output/FuncAnnotChart/",filenames[i])
  
      FuncAnnotClust_names <- paste("/output/FuncAnnotClust/",filenames[i])
  
      FuncAnnotTable_names <- paste("/output/FuncAnnotTable/",filenames[i])

##You can put multiple input files in the input folder and get the results for each one. For the input format, please refer example_input.txt
