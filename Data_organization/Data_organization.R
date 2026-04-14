
library(dplyr)

#-----------------------------------------------------------------------------NA Remove
A <- Data %>% drop_na(data$column)

#-----------------------------------------------------------------------------Replace (A列のNAを5, ｂ列のNAを3にする。)
replace_na(data_name, list(column_a = 5, column_b = 3)

#-----------------------------------------------------------------------------Coversion
mutate(data_name, new_column_name = na_if(column_name, 4)

#-----------------------------------------------------------------------------detection of NA
is.na(x)

#-----------------------------------------------------------------------------Filter and select
Filter: A <- Data_name %>% filter(Column_name =="urban" )
Filter: A <- Data_name %>% filter(Column_name,  X < 0 | X 1> 12 ) #or
data_2 <- data_1 %>% mutate(anxiousyoga = if_else(Q7 == 5 | Q7 == 6, 1, 0))
#!= 4 (not equal), AかつB: X < 0 & X 1> 12

Select: A <- Select (Data, column name, column name)

#------------------------------------------------------------------------------Addition of work column
A <- data_name %>% mutate(column_name = “cold”)

#------------------------------------------------------------------------------lag and behind column
A <- mutate(data_name, new_column_name = lag(column_name, 3, defalt = 0)
# 0 will be put to column moved

#-------------------------------------------------------------------------------Multiplication
mutate(data_name, new_column_name = column_name * 3)

#-------------------------------------------------------------------------------Replacement values  in one condition
mutate(data_name, new_column_name = if_else (x1 > 3, 4, x1)

#-----------------------------------------------------------------------------Change of values in multiple conditions (https://www.sharpsightlabs.com/blog/case-when-r/)
mutate(new_column_name = case_when(
Column_name == 0 & column == “A” ~ 1,
Column_name == 0 & column == “B” ~ 1,
True ~ 0) #それ以外の値は0

#------------------------------------------------------------------------------Change of column name
colnames(data) <- c("name”, “name”, "name”, “name”)
Data <- data %>% rename(length = len)

#-------------------------------------------------------------------------------Change of categorical data name
fct_recode(data$A, S = “small”, M = “medium”, L = “large”)

#-----------------------------------------------------------------------------Change of order of categorical data
size <- factor(data$A, levels = c(“small”, “medium”, “large)

#----------------------------------------------------------------------------Rearrangement of row (e.g., Countryのアルファベット順に並び替え)
Data_GDP <- Data_GDP %>% arrange(Country)

#-------------------------------------------------------------------------------GDPの小さい順に並べ替え 
Data <- data %>% order(dataset$Weight, decreasing = TRUE))

#-----------------------------------------------------------------------------Combine row or column
Data <- rbind(data, data)
Data <- cbind(data, data)

colnames(data_name)


       
