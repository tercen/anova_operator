library(tercen)
library(dplyr)

do.anova = function(df){
  pr = NaN
  aLm = try(lm(.y ~ .group.colors, data=df), silent = TRUE)
  if(!inherits(aLm, 'try-error')) pr = (anova(aLm)$'Pr(>F)')[[1]]
  return (data.frame(.ri = df$.ri[1], .ci = df$.ci[1], pr= c(pr)))
}
  
ctx = tercenCtx()

if (len(ctx$colors) < 1) stop("A color factor is required.")
 
ctx %>% 
  select(.ci, .ri, .y) %>%
  mutate(.group.colors = do.call(function(...) paste(..., sep='.'), ctx$select(ctx$colors))) %>%
  group_by(.ci, .ri) %>%
  do(do.anova(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()
