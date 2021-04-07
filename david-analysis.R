library(org.Hs.eg.db)
library("RDAVIDWebService")

setwd("/path/")
filenames = list.files(pattern="*.txt")
david <- DAVIDWebService(email='your email address',
                         url="https://david.ncifcrf.gov/webservice/services/DAVIDWebService.DAVIDWebServiceHttpSoap12Endpoint/")
hs <- org.Hs.eg.db
David_analysis<-function(filenames,david, hs){
  for(i in 1:length(filenames)) {
    t <- read.table(filenames[i]) # load file
    input_data_as_c <- as.character(t[,])
    to_entrez_id <- select(hs, 
                           keys = input_data_as_c,
                           columns = c("ENTREZID", "SYMBOL"),
                           keytype = "SYMBOL")
    entrez_id <- to_entrez_id$ENTREZID
    list_Name <- paste(filenames[i])
    FG <- addList(david, entrez_id, idType="ENTREZ_GENE_ID", listName=list_Name, listType="Gene")
    
    # Specifiy annotation categories.
    # find the categories name by using: getAllAnnotationCategoryNames(david)
    
    setAnnotationCategories(david, c("GAD_DISEASE","GOTERM_BP_DIRECT", "GOTERM_MF_DIRECT", "GOTERM_CC_DIRECT","BIOCARTA","KEGG_PATHWAY","REACTOME_PATHWAY"))
    
    FuncAnnotChart_names <- paste("/output/FuncAnnotChart/",filenames[i])
    FuncAnnotClust_names <- paste("/output/FuncAnnotClust/",filenames[i])
    FuncAnnotTable_names <- paste("/output/FuncAnnotTable/",filenames[i])
    
    # Get functional annotation chart as R object.
    FuncAnnotChart <- getFunctionalAnnotationChart(david)
    getFunctionalAnnotationChartFile(david, FuncAnnotChart_names)
    
    FuncAnnotClust <- getClusterReport(david)
    getClusterReportFile(david, FuncAnnotClust_names)
    
    FuncAnnotTable <- getFunctionalAnnotationTable(david)
    getFunctionalAnnotationTableFile(david, FuncAnnotTable_names)
    
  }
  
}
