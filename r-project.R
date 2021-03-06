#Flipkart smart phones catalogue analysis

#In this project I have scrapped a sample data from one of the most popular e-commerce website
#in India(Flipkart) about the smart phones trends. We will analyse the popularity of the smart phones
#on flipkart with the highest rated smart phones along with the demographic influence of other
#countries in the Indian smart phone market. This Analysis will help us understand that what
#kind of smart phones are being sold in India and will predict the future sales pattern of the
#same.

#LOADING THE DATA IN RSTUDIO

data_main <- read.csv(choose.files())

data_main_backup <- data_main
data_main_1 <- data_main_backup
data_main_2 <- data_main_1
rm(data_main_backup)
#let's dosome data exploration and data cleaning.

head(data_main)
str(data_main)

data_main$Company <- as.factor(data_main$Company)
data_main$Country.of.Origin <- as.factor(data_main$Country.of.Origin)
data_main$Ratings <- as.factor(data_main$Ratings)

summary(data_main$Price)

data_main$Price <- as.character(as.numeric(data_main$Price))

rm(data_main)

data_main_1$Company <- as.factor(data_main_1$Company)
data_main_1$Country.of.Origin <- as.factor(data_main_1$Country.of.Origin)
data_main_1$Ratings <- as.factor(data_main_1$Ratings)

str(data_main_backup)

head(data_main_backup$Price, 10)

data_main_1$Price <- gsub("�,�", "", data_main_1$Price)
data_main_1$Price <- gsub(",", "", data_main_1$Price)

str(data_main_backup)

data_main_backup$Price <- as.numeric(data_main_backup$Price)

high_rated_prod <- data.frame(data_main_backup$Product.Name, data_main_backup$Ratings)
rm(high_rated_prod)

#locating missing data
data_main_backup[!complete.cases(data_main_backup),]

high_rated_prod <- data.frame(c("Product.Name", "Ratings"))

colnames(high_rated_prod) <- c("ProductName", "Ratings")


high_rated_prod$Ratings <- as.numeric(high_rated_prod$Ratings)
rm(high_rated_prod)


data_main_1$Ratings <- gsub("null","NA",data_main_1$Ratings)
data_main_1$Ratings <- gsub("NA","",data_main_1$Ratings)


high_rated_prod <- unique(data_main_1[data_main_1$Ratings  > 4.5,])

High_rated_vec <- data.frame( Product = c("Apple Iphone SE", "Samsung Galaxy S20", "Iphone 11", "OnePlus 8"),
                             Ratings = c(4.6, 4.7, 4.7, 5))

qplot(data = data_main_1, x= Company, y = Ratings, colour = Country.of.Origin, size = I(5))
  

qplot(data = High_rated_vec, x= Product, y = Ratings, colour = I("Blue"), Size = I(10))  



str(High_rated_vec)
High_rated_vec$Product <- as.factor(High_rated_vec$Product)  
  
qplot(data = High_rated_vec, x= Product, y = Ratings, size = I(15), colour = I("Blue"))  



  
  