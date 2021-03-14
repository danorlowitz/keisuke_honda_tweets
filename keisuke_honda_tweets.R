library(dplyr)
library(rtweet)
library(ggplot2)
test <- search_tweets("keisuke honda", n=100,include_rts=FALSE) #pulls tweets
languages <- test %>% #creates new df
  select(user_id,lang) %>% #only pulls relevant columns
  group_by(lang) %>% #groups rows by language
  summarize(count = n()) #adds count for each language
  vis <- ggplot(languages,aes(x = lang, y = count))+ #creates plot
  geom_bar(aes(x = reorder(lang, -count), fill = reorder(lang, -count)), stat = "identity")+ #adds bars to plot, orders & colors by language
  labs(title="Keisuke Honda tweets",subtitle="By language",fill="Language")+ #adds labels
  xlab("Language of tweet")+
  ylab("Number of tweets")+
ggsave("keisukehonda_bylanguage.png") #outputs png