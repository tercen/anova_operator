library(tercen)
library(dplyr)

do.anova = function(df){
  pr = NaN
  aLm = try(lm(.y ~ .x, data=df), silent = TRUE)
  if(!inherits(aLm, 'try-error')){
    pr = (anova(aLm)$'Pr(>F)')[[1]]
  }  

  return (data.frame(.ri = df$.ri[1],
                     .ci = df$.ci[1],
                     pr=c(pr)))
}
 

# df = data.frame(.ri=c(0,0,0,0,0,0,0,0),
#                 .ci=c(0,0,0,0,0,0,0,0),
#                 .y=c(1.0,2.0,3.0,4.3, 10.2,10.3,11.3,12.3),
#                 .x=c("0","0","0","0","1","1","1","1"))
# 
# do.anova(df)
 
(ctx = tercenCtx())  %>% 
  select(.y,.x,.ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  do(do.anova(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()
