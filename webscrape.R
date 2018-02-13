library('rvest')

library('xml2')
library('Rcpp')
url<-'http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'
#read code from html
webpage<-read_html(url)
#use CSS selectors to scrape rankings
#scraping the following data from website (rank,Title,Description,Runtime,Genre,Rating,Metascore,Votes,Gross_Earning_in_Mil,Director,Actor)
rank_data_html<-html_nodes(webpage,'.text-primary')
#convert ranking data to text
rank_data<-html_text(rank_data_html)
#look at rankings now
head(rank_data)
#convert rankins to numerical
rank_data<-as.numeric(rank_data)
head(rank_data)
#CSS selectors to scrape title section
title_data_html<-html_nodes(webpage,'.lister-item-header a')
#convert title data to text
title_data<-html_text(title_data_html)
head(title_data)
#CSS selectors to scrap the description section
description_data_html<-html_nodes(webpage,'.ratings-bar+ .text-muted')
#convertin description data to text
description_data<-html_text(description_data_html)
head(description_data)
#CSS selectors to scrap the Movie runtime section
runtime_data_html<-html_nodes(webpage,'.text-muted .runtime')
#Converting the runtime data to text
runtime_data<-html_text(runtime_data_html)
head(runtime_data)
#removing mins and converting it to numerical
runtime_data<-gsub(" min","",runtime_data)
#convert to numeric
runtime_data<-as.numeric(runtime_data)
head(runtime_data)
#CSS selectors to scrap the Movie genre section
genre_data_html<-html_nodes(webpage,'.genre')
#Converting the genre data to text
genre_data<-html_text(genre_data_html)
head(genre_data)
#removing \n
genre_data<-gsub("\n","",genre_data)
#removing excess spaces
genre_data<-gsub(" ","",genre_data)
#taking only the first genre of each movie
genre_data<-gsub(",.*","",genre_data)
head(genre_data)
#Converting each genre from text to factor
genre_data<-as.factor(genre_data)
head(genre_data)
#CSS selectors to scrap the IMDB rating section
rating_data_html<-html_nodes(webpage,'.ratings-imdb-rating strong')
#Converting the ratings data to text
rating_data<-html_text(rating_data_html)
head(rating_data)
#converting ratings to numerical
rating_data<-as.numeric(rating_data)
head(rating_data)
#CSS selectors to scrap the votes section
votes_data_html<-html_nodes(webpage,'.sort-num_votes-visible span:nth-child(2)')
#Converting the votes data to text
votes_data<-html_text(votes_data_html)
head(votes_data)
#removing commas
votes_data<-gsub(",","",votes_data)
#converting votes to numerical
votes_data<-as.numeric(votes_data)
head(votes_data)
#CSS selectors to scrap the directors section
directors_data_html<-html_nodes(webpage,'.text-muted+ p a:nth-child(1)')
#Converting the directors data to text
directors_data<-html_text(directors_data_html)
head(directors_data)
#converting directors data into factors
directors_data<-as.factor(directors_data)
head(directors_data)
#CSS selectors to scrap the actors section
actors_data_html<-html_nodes(webpage,'.lister-item-content .ghost+ a')
#Converting the gross actors data to text
actors_data<-html_text(actors_data_html)
head(actors_data)
#converting actors data into factors
actors_data<-as.factor(actors_data)
head(actors_data)
#CSS selectors to scrap the metascore section
metascore_data_html<-html_nodes(webpage,'.metascore')
#Converting metascore data to text
metascore_data<-html_text(metascore_data_html)
head(metascore_data)
#removing extra space in metascore
metascore_data<-gsub(" ","",metascore_data)
head(metascore_data)
length(metascore_data)
# After a visual inspection, I found that the Metascore is missing for movies 39, 73, 80 and 89.
for(i in c(39,73,80,89)){
  a<-metascore_data[1:(i-1)]
  
  b<-metascore_data[i:length(metascore_data)]
  
  metascore_data<-append(a,list("NA"))
  
  metascore_data<-append(metascore_data,b)
  
}
#converting metascore to numerical
metascore_data<-as.numeric(metascore_data)
length(metascore_data)
summary(metascore_data)
#CSS selectors to scrap the gross revenue section
gross_data_html<-html_nodes(webpage,'.ghost~ .text-muted+ span')
#Converting the gross revenue data to text
gross_data<-html_text(gross_data_html)
head(gross_data)
#removing '$' and 'M' signs
gross_data<-gsub("M","",gross_data)
gross_data<-substring(gross_data,2,6)
head(gross_data)
length(gross_data)
#Filling missing entries with NA
for (i in c(17,39,49,52,57,64,66,73,76,77,80,87,88,89)){
  
  a<-gross_data[1:(i-1)]
  
  b<-gross_data[i:length(gross_data)]
  
  gross_data<-append(a,list("NA"))
  
  gross_data<-append(gross_data,b)
  
}

#Data-Preprocessing: converting gross to numerical
gross_data<-as.numeric(gross_data)

#Let's have another look at the length of gross data
length(gross_data)
summary(gross_data)
#combine 11 features to create a dataframe and inspect its structure.

movies_df<-data.frame(Rank=rank_data, Title=title_data, Description=description_data, Runtime=runtime_data, Genre=genre_data, Rating=rating_data, Metascore=metascore_data, Votes=votes_data)# Gross_Earning_in_Mil=gross_data, Director=directors_data)
str(movies_df) 
library('ggplot2')
qplot(data=movies_df,Runtime,fill=Genre,bins=30)
#ggplot(movies_df,aes(x=Runtime,y=Rating))+geom_point(aes(size=Votes,col=Genre))
