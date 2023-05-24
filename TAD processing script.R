##Load library
library(tidyverse)

#Load Data
raw_data <- read_csv("FILENAME.csv")
raw_data <- X2022_11_04_Dpse_UCI_mRNA_Dpse_TL_SPE123_6_3_B_Flye_v2_pilon_mb_hits

#group by Query and subject and choose the highest percentage
decision_data <- raw_data %>% group_by(Query,Subject) %>% arrange(desc(`% Match`)) %>%
  mutate(choice = if_else(row_number() == 1,"yes","no" ))

a <- decision_data %>% filter(Subject == "Dpseu_CH__TAD_Boundary_451_452_03221282_03226013")
#Check to make sure it is correct 
a <- decision_data4 %>% filter(Query == "XM_001352246.4")

write.csv(decision_data, file="high_match.csv")




#Take Query and Locus from file 1 and match to file 2. When we find the match, we keep TAD_ID
library(readxl)
Blast_data <- read_excel("FILENAME.xlsx")
dpse_data <- read_excel("FILENAME.xlsx",sheet = SHEET#)

join_data <- inner_join(Blast_data,dpse_data[,c("Transcript","Locus","TAD_ID")],by = c("Query" = "Transcript",
                                                                                       "Locus" = "Locus"))

#Add include1 column to remove redundant loci
Blast <- AR_to_TL %>%
  group_by(Locus, Subject) %>%
  mutate(Include1 = if_else(duplicated(Locus)==FALSE, "yes", "no"))

write.csv(Blast, file = "FILENAME.csv")


