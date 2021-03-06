pollutantmean <- function(directory, pollutant, id = 1:332) {
    # armazenar os arquivos em uma vari�vel
    my_data <- list.files(path = "C:/Users/marin/OneDrive/Documentos/specdata")[id]
    
    #ler os arquivos do my_data (do tipo .csv)
    read_files <- lapply(my_data, read.csv)
    
    #juntar os arquivos em um �nico arquivo para calcular a m�dia de uma vez s�
    combine <- do.call(rbind,read_files)
    
    #calcular a m�dia (sem NA)
    mean(combine[,pollutant], na.rm = TRUE)
}
