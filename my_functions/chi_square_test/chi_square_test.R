

chi_sqaure_test <- function(df,target) {
  
  cat("Chi-squared test for independence \n with Yates' continuity correction","\n","\n")
  
  for (i in 1:length(df)) {
    df[i] <- factor(df[[i]])
  }
  
  X <- df[,which(names(df)!=target)]
  Y <- df[,target]
  X_names <- names(df)[which(names(df)!=target)]
  
  for(i in 1:ncol(X)) {
    
    c_table <- table(Y,X[[i]])
    chi_sq <- 0
    dof <- (nrow(c_table) - 1) * (ncol(c_table) - 1) 
    for(m in levels(Y)) {
      
      for(n in levels(X[[i]])) {
        
        O=c_table[m,n]
        E=round( sum(X[[i]]==n) * sum(Y==m) / length(Y) )
        chi_sq <- chi_sq + round(((O-E)-0.5)^2/E)
      
      }
      
    }
    
    pval=1-pchisq(chi_sq,dof)
    
    cat(paste(X_names[i],"\t",
            "DOF = ",dof,",","\t",
            "Chi Square = ",chi_sq,"\t",
            "p-value = ",pval,
            "\n",
            sep = " "
            ))
    
  }
}
