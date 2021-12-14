library(Biostrings)
library(msa)

path = "xxx"

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
  aa <- readAAStringSet(file)
  aln <- msa(aa)
  try(msaPrettyPrint(aln, output='pdf', askForOverwrite=FALSE, showLogo="top", shadingMode="functional", shadingModeArg="chemical", verbose=TRUE), silent=TRUE)

}