# Web-Scrapping

Project name:Web scraping in R using Selector Gadget chrome extension and rvest package in R

Description:

web scraping is a technique of converting the data present in unstructured format over the web to the structured format which can be easily accessed and used. In this project I used R for scrapping the data for the most popular feature films of 2016 from the IMDb website.

I used DOM Parsing approach and rely on the CSS selectors of the webpage for finding the relevant fields which contain the desired information.

we will get number of features for each of the 100 most popular feature films. Also, address most common problems you would come accross while scrapping the data from the internet because of lack of inconsistency in website code and how to solve these problems.

Some characteristics of this project: 

scraping the following data such as(Rank,Title,Description,Genre, Metascore ,Director ,Runtime ,Rating ,Votes,Actor ) from IMDB website to analyse the scrapped data to gain insights.

Table of Contents:

What is Web Scraping- 

Web scraping is a technique for converting the data present in unstructured format (HTML tags) over the web to the structured format which can easily be accessed and used.

Why do we need Web Scraping-

Scrapping movie rating data to create movie recommendation engines.Scrapping text data from Wikipedia and other sources for making NLP-based systems or training deep learning models for tasks like topic recognition from the given text.Scrapping labeled image data from websites like Google, Flickr, etc to train image classification models.Scrapping data from social media sites like Facebook and Twitter for performing tasks Sentiment analysis, opinion mining, etc.Scrapping user reviews and feedbacks from e-commerce sites like Amazon, Flipkart, etc.

Ways to scrap data-Some of the popular ways are:Human Copy-Paste,Text pattern matching,API Interface,DOM Parsing

Pre-requisites-rvest package, HTML and CSS, download the Selector Gadget extension

Scraping a web page using R-url <- 'http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'

Analyzing scraped data from the web-analyzing the data and drawing inferences from it using library('ggplot2') in R

Question 1: Based on the data, which movie from which Genre had the longest runtime? 
Question 2: Based on the data, in the Runtime of 130-160 mins, which genre has the highest votes?
Question 3: Based on the data, across all genres which genre has the highest average gross earnings in runtime 100 to 120

Installation: 1. download R it is opensource 2. open R studio and upload imbalancedproject folder.

Prerequisites: An Intel-compatible platform running Windows 2000, XP/2003/Vista/7/8/2012 Server/8.1/10.

At least 32 MB of RAM, a mouse, and enough disk space for recovered files, image files, etc.

The administrative privileges are required to install and run R-Studio utilities under Windows 2000/XP/2003/Vista/7/8/2012 Server/8.1/10.

A network connection for data recovering over network.

Installing R under Windows:

The bin/windows directory of a CRAN site contains binaries for a base distribution and a large number of add-on packages from CRAN to run on 32- or 64-bit Windows (Windows 7 and later are tested; XP is known to fail some tests) on ‘ix86’ and ‘x86_64’ CPUs.

Your file system must allow long file names (as is likely except perhaps for some network-mounted systems). If it doesn’t also support conversion to short name equivalents (a.k.a. DOS 8.3 names), then R must be installed in a path that does not contain spaces.

Installation is via the installer R-3.4.3-win.exe. Just double-click on the icon and follow the instructions. When installing on a 64-bit version of Windows the options will include 32- or 64-bit versions of R (and the default is to install both). You can uninstall R from the Control Panel.

Note that you will be asked to choose a language for installation, and that choice applies to both installation and un-installation but not to running R itself.
