list.of.packages <- c("data.table", "magrittr", "tidyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(data.table)
library(magrittr)
library(tidyr)
BBS<-fread("C:/mycode/1202/occurrence.txt",sep="\t",encoding="UTF-8")
str(BBS)
BBS %<>% Filter(function(x)!all(is.na(x)), .)
#=BBS<-BBS%>%Filter(function(x)!all(is.na(x),BBS))
#'F'ilter大寫,%<>%右邊做完丟回左邊=BBS<-%>%...,!等於not,all(is.na(x),BBS) 先判定欄位中是否為NA,加!表示不是NA的值,再過濾留下
a<-BBS %>%
  select(where(~!all(is.na(.))))
  