# fun��o que l� um diret�rio com v�rios arquivos e mostra o n�mero de casos
# observados em cada arquivo (ou seja, o total de dias observados por uma esta��o 
# de monitoramento x). vai retornar: nome do arquivo/esta��o (primeira col),
# casos completos/dias monitorados (segunda col)

complete <- function(directory, id = 1:332){
    
    # armazenar os arquivos em uma vari�vel
    mdata <- list.files(path = "C:/Users/marin/OneDrive/Documentos/specdata")[id]
    
    #criar um vetor vazio
    mrows <- c()
    counter <- 1
    
    #loop
    for(m in mdata){
        
    # armazenar os arquivos .csv sem os valores NA em uma vari�vel
    # o na.omit exclui as linhas com missing
        
    mobject <- na.omit(read.csv(m))  
                       
    # armazenar o n�mero de linhas do mobject vazio
    mrows [counter] <- nrow(mobject)
    counter <- counter + 1
}
    
    # criar e printar a lista com a esta��o e os dias monitorados
    mlist <- data.frame("id" = id, "nobs" = mrows)
    print(mlist)
}