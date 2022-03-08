
library(mice)

md.pattern(nhanes)

library(VIM)

marginplot(nhanes[,c("chl", "bmi")], pch = 19)

# missing completely at random (MCAR)
# missing at random (MAR) 
# missing not at random (MNAR) 

# multiply imputed data set; mids 
imp = mice(nhanes, m = 10, seed = 1) 
# m = 5 by default 

print(imp)

# imputed dataset 
imp$imp

# complete dataset 
complete(imp, action = "long")

# univariate distribution 
stripplot(imp)

# multiply imputed repeated analysis: mira  
fit = with(imp, lm(chl ~ age + bmi))

# multiply imputed pooled outocmes: mipo

print(pool(fit)) 
## lambda: prop of the total variance that is attributable to the missing data 
## fmi: fraction of missing information 

summary(pool(fit))

# imputation methods 
str(nhanes2)
md.pattern(nhanes2)

imp <- mice(nhanes2, me = c("polyreg", "pmm", "logreg", "norm"))









