pollutantmean <- function(directory, pollutant, id = 1:332) {
    # armazenar os arquivos em uma variável
    my_data <- list.files(path = "C:/Users/marin/OneDrive/Documentos/specdata")[id]
    
    #ler os arquivos do my_data (do tipo .csv)
    read_files <- lapply(my_data, read.csv)
    
    #juntar os arquivos em um único arquivo para calcular a média de uma vez só
    combine <- do.call(rbind,read_files)
    
    #calcular a média (sem NA)
    mean(combine[,pollutant], na.rm = TRUE)
}
