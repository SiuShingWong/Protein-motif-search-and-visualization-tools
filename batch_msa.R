library(Biostrings)
library(msa)

# path = "C:/Users/extin/Dropbox/DPhil in Molecular Cell Biology/data/Bioinformatics/Conservation across different Drosophila species/Data"
path = "C:/Users/extin/Dropbox/DPhil in Molecular Cell Biology/data/Bioinformatics/Viewing different organisms/Mammals"

temp <- list.files(path, pattern="[a-zA-Z]+", full.names = TRUE)
files = character()
save_paths = character()

for (f in temp) {
  if (!grepl('Figures$', f)) {
    files = c(files, list.files(f, pattern="work*", full.names = TRUE))
    save_paths = c(save_paths, list.files(f, pattern="Figu*", full.names = TRUE))
  }
}
print (files)
for (i in 1:length(files)){
  print (i)
  file <- files[i]
  setwd(save_paths[i])
  #save_name <- paste(save_paths[i], 'aln.pdf', sep='/')
  aa <- readAAStringSet(file)
  aln <- msa(aa)
  try(msaPrettyPrint(aln, output='pdf', askForOverwrite=FALSE, showLogo="top", shadingMode="functional", shadingModeArg="chemical", verbose=TRUE), silent=TRUE)
  # msaPrettyPrint(aln, output='pdf', askForOverwrite=FALSE, showLogo="top", shadingMode="functional", shadingModeArg="chemical", verbose=TRUE)
}