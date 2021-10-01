#
# Simple script to create a list of users and set them up on the server 
# (via a list of commands to be reviewed manually and pasted into bash)
#

library(tidyverse)
library(whisker)
library(stringi)
students <- read_csv('student_IDs.csv')

cmdtemplate <- "# {{username}}
sudo adduser {{username}} --gecos '' --disabled-password --disabled-login
echo {{username}}:{{newpass}} | sudo chpasswd
sudo usermod -g students {{username}}"

mkpass <- function(){
  paste0(c(sample(lexicon::freq_first_names$Name, 1),
           sample(lexicon::pos_action_verb, 1),
           sample(lexicon::pos_interjections, 1),
           sample(lexicon::pos_df_irregular_nouns$singular, 1)), collapse = "-") %>% stringr::str_squish() %>% tolower(.)}

mkpass2 <- function(){
  x <- stri_rand_strings(n=4, length=c(2,1,3,2), pattern=c("[a-z]","[A-Z]","[0-9]","[a-z]"))
  x <- stri_rand_shuffle(stri_flatten(x))
}


# create commands for bash to review and then run on the server
students_with_passwords_and_commands <- 
  students %>% 
  rowwise() %>% 
  mutate(newpass=mkpass2()) %>% 
  group_by(username, newpass) %>% 
  do(., tibble(cmd=whisker::whisker.render(cmdtemplate, data=list(username=.$username, newpass=.$newpass))))

students_with_passwords_and_commands
# save for reference (e.g. to inform students via mail merge)
write_csv(students_with_passwords_and_commands, "students_with_passwords_and_commands.csv")

# print bash commands to screen to review and use
students_with_passwords_and_commands %>% 
  .$cmd %>% cat(., sep="\n\n\n")