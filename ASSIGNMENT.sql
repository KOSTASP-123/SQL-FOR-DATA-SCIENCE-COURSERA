/*
Author: Konstantinos Papacharalampous
Date: 13-03-2021

Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.

*/

--Part 1: Yelp Dataset Profiling and Understanding

/*
--1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000 
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000 
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000 
viii. photo table = 10000 
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562 
iii. Category = 2643 
iv. Attribute = 1115 
v. Review = For PK id as expected = 10000, Business_id = 8090, USer_id = 9581 
vi. Checkin = 493
vii. Photo = For PK id = 10000 and for Business_id = 6493 
viii. Tip = For Business_id = 3979 and for user_id = 537
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780 

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	

*/

--3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

--	Answer: No
	
	
--	SQL code used to arrive at answer:
	
-- Will do a count on the PK for the table as the PK can not contain NULL value. This will give me all the table records
-- Then do a count of each column which will yield all Non NULL records (N.B COUNT(*) would have uncluded NULL records as well)
-- if the column specific count is < (less) than the PK Count then this is an inidcation of the existence of NULL values in the entries in the database.
SELECT COUNT(id) AS id, COUNT(name) AS NAME,COUNT(review_count) AS REVIEW_COUNT, COUNT(YELPING_SINCE) AS YELPING_SINCE,
COUNT(USEFUL) AS USEFUL, COUNT(FUNNY) AS FUNNY,COUNT(COOL) AS COOL, COUNT(FANS) AS FANS,
COUNT(AVERAGE_STARS) AS AVERAGE_STARS, COUNT(COMPLIMENT_HOT) AS COMPLIMENT_HOT,COUNT(COMPLIMENT_MORE) AS COMPLIMENT_MORE, 
COUNT(COMPLIMENT_PROFILE) AS COMPLIMENT_PROFILE, COUNT(COMPLIMENT_CUTE) AS COMPLIMENT_CUTE,
COUNT(COMPLIMENT_LIST) AS COMPLIMENT_LIST, COUNT(COMPLIMENT_NOTE) AS COMPLIMENT_NOTE,
COUNT(COMPLIMENT_PLAIN) AS COMPLIMENT_PLAIN, COUNT(COMPLIMENT_COOL) AS COMPLIMENT_COOL, 
COUNT(COMPLIMENT_FUNNY) AS COMPLIMENT_FUNNY, COUNT(COMPLIMENT_WRITER) AS COMPLIMENT_WRITER,
COUNT(COMPLIMENT_PHOTOS) AS COMPLIMENT_PHOTOS
FROM user

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:1		max:5		avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:1		max:5		avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:0		max:2		avg: 0.0144 
		
	
	iv. Table: Checkin, Column: Count
	
		min:1		max:53		avg: 1.9414 
		
	
	v. Table: User, Column: Review_count
	
		min:0		max:2000		avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
	-- added next to City the REVIEW_COUNT as well to validate the results.
	SELECT CITY, REVIEW_COUNT FROM BUSINESS --NEED TO CORRECT ADD SUM(REVIEW_COUNT) AS REVIEWS
    ORDER BY REVIEW_COUNT DESC
	
	Copy and Paste the Result Below:
	
 city       | review_count |
+------------+--------------+
| Las Vegas  |         3873 |
| Montréal   |         1757 |
| Gilbert    |         1549 |
| Las Vegas  |         1410 |
| Las Vegas  |         1389 |
| Las Vegas  |         1252 |
| Las Vegas  |         1116 |
| Las Vegas  |         1084 |
| Las Vegas  |          961 |
| Gilbert    |          902 |
| Las Vegas  |          864 |
| Scottsdale |          823 |
| Las Vegas  |          821 |
| Las Vegas  |          786 |
| Henderson  |          785 |
| Toronto    |          778 |
| Las Vegas  |          768 |
| Las Vegas  |          758 |
| Scottsdale |          726 |
| Cleveland  |          723 |
| Las Vegas  |          720 |
| Charlotte  |          715 |
| Phoenix    |          711 |
| Las Vegas  |          706 |
| Phoenix    |          700 |
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT  STARS, COUNT(STARS) AS 'COUNT'
FROM BUSINESS
WHERE CITY = 'Avon'
GROUP BY STARS

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

+-------+-------+
| stars | COUNT |
+-------+-------+
|   1.5 |     1 |
|   2.5 |     2 |
|   3.5 |     3 |
|   4.0 |     2 |
|   4.5 |     1 |
|   5.0 |     1 |
+-------+-------+

ii. Beachwood

SQL code used to arrive at answer:

SELECT  STARS, COUNT(STARS) AS 'COUNT'
FROM BUSINESS
WHERE CITY = 'Beachwood'
GROUP BY STARS

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		
+-------+-------+
| stars | COUNT |
+-------+-------+
|   2.0 |     1 |
|   2.5 |     1 |
|   3.0 |     2 |
|   3.5 |     2 |
|   4.0 |     1 |
|   4.5 |     2 |
|   5.0 |     5 |
+-------+-------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
SELECT ID, NAME, REVIEW_COUNT
FROM USER
ORDER BY 3 DESC
LIMIT 3

		
	Copy and Paste the Result Below:
	
	+------------------------+-----------+--------------+
| id                     | name      | review_count |
+------------------------+-----------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: Love

	
	SQL code used to arrive at answer:

-- I am performing a count on the PK and add a CASE statement to dinquish between HATE & LOVE in Text Column
-- I add an ELSE to capture all the cases where Hate or Love is not present in text.
-- I use the LIKE argument to search for the speicified words in the text column.

SELECT COUNT(ID), 
CASE WHEN TEXT LIKE '%hate%' THEN 'HATE'
     WHEN TEXT LIKE '%love%' THEN 'LOVE'
     ELSE 'N/A' END AS 'VALIDATION'
FROM REVIEW
GROUP BY 2
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:

SELECT ID, NAME, FANS
FROM USER
ORDER BY 3 DESC
LIMIT 10;	
	
	Copy and Paste the Result Below:

+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

Yes
+---------------------+-----------+
| hours               | GROUPING  |
+---------------------+-----------+
| Saturday|8:00-22:00 | 2-3 Stars |
| Saturday|9:00-17:00 | 4-5 Stars |
+---------------------+-----------+

Code Used:

SELECT h.hours,
CASE WHEN STARS BETWEEN 4 AND 5 THEN '4-5 Stars'
     WHEN STARS BETWEEN 2 AND 3 THEN '2-3 Stars'
     ELSE 'N/A' END AS 'GROUPING'
FROM BUSINESS B, CATEGORY C
left JOIN hours H ON  B.ID = H.BUSINESS_ID 
WHERE B.ID = C.BUSINESS_ID
AND (B.CITY  = 'Las Vegas' OR c.category = 'Food')
AND H.HOURS != 'None' -- I selected to do a left join above and then filter out records with no hours registered.
AND GROUPING IN ('4-5 Stars','2-3 Stars')
GROUP BY 2


ii. Do the two groups you chose to analyze have a different number of reviews?
     Yes, note though as the output only captured one group. That is because there were reviews in dataset
	 for only Group 4-5 stars while 2-3 Stars has no reviews left.
+---------------+-----------+
| Reviews_Count | GROUPING  |
+---------------+-----------+
|            20 | 4-5 Stars |
+---------------+-----------+

Code USed:

SELECT count(r.id) AS 'Reviews_Count',
CASE WHEN b.STARS BETWEEN 4 AND 5 THEN '4-5 Stars'
     WHEN b.STARS BETWEEN 2 AND 3 THEN '2-3 Stars'
     ELSE 'N/A' END AS 'GROUPING'
FROM BUSINESS B, CATEGORY C
join review R ON  B.ID = R.BUSINESS_ID 
WHERE B.ID = C.BUSINESS_ID
AND (B.CITY  = 'Las Vegas' OR c.category = 'Food')
AND GROUPING IN ('4-5 Stars','2-3 Stars')
GROUP BY 2
    
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

Not much given that I have selected City as Las Vegas for this exercise and category as food.

So no surprise majority of my results/records as around Las vegas with 57 business fallind under
4-5 star category and onlny 10 under 2-3 star category. 

Code Used:
SELECT CITY,
CASE WHEN b.STARS BETWEEN 4 AND 5 THEN '4-5 Stars'
     WHEN b.STARS BETWEEN 2 AND 3 THEN '2-3 Stars'
     ELSE 'N/A' END AS 'GROUPING',
COUNT(B.ID) AS 'Business Count'
FROM BUSINESS B, CATEGORY C
WHERE B.ID = C.BUSINESS_ID
AND (B.CITY  = 'Las Vegas' OR c.category = 'Food')
AND GROUPING IN ('4-5 Stars','2-3 Stars')
GROUP BY 1,2
ORDER BY 1,2 DESC,3 DESC

Now given I want to have a deeper look in the Las Vegas data I concentrate on that only and zooming in on neighborhood
data, now unfortunately not all records have a neighborhood specified but for those records that do,
I can see that Eastside has only two 4-5 stars businesses while it has majority of
2-3 Stars businesses amounting to 7. On the other hand Summerlin seem to be where amajority of 4-5 stars business are (ten in total) followed by 
China town with 7 businesses with 4-5 stars rating.


Code Used:
SELECT CITY, neighborhood,
CASE WHEN b.STARS BETWEEN 4 AND 5 THEN '4-5 Stars'
     WHEN b.STARS BETWEEN 2 AND 3 THEN '2-3 Stars'
     ELSE 'N/A' END AS 'GROUPING',
COUNT(B.ID) AS 'Business Count'
FROM BUSINESS B, CATEGORY C
WHERE B.ID = C.BUSINESS_ID
AND (B.CITY  = 'Las Vegas') 
AND GROUPING IN ('4-5 Stars','2-3 Stars')
GROUP BY 2,3
ORDER BY 2,3 DESC

SQL code used for analysis:

		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         
         
ii. Difference 2:
         
         
         
SQL code used for analysis:

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
                           
                  
iii. Output of your finished dataset:
         
         
iv. Provide the SQL code you used to create your final dataset:
