/*===================================================
LIKE
====================================================*/
/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name 
bilgilerini listeyen sorguyu yazınız*/

SELECT name 
FROM tracks 
WHERE composer 
LIKE "%Bach";

/* albulms tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
listeyen sorguyu yazınız*/

SELECT *
FROM albums
WHERE Title
LIKE "%Greatest%";

/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/

SELECT *
FROM invoices
WHERE InvoiceDate LIKE "201_-02-%";

/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
LastName ve City bilgilerini	listeleyen sorguyu yazınız*/

SELECT FirstName, LastName, City
FROM customers
WHERE FirstName LIKE "___";

/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
LastName ve City bilgilerini listeleyen sorguyu yazınız*/

SELECT FirstName, LastName, City
FROM customers
WHERE LastName LIKE "Sch%" OR LastName LIKE "Go%";

/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
-- COUNT
------------------------------------------------------------------------------
/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */

SELECT COUNT(*)  --tamamını sayar (null dahildir.
FROM invoices;

SELECT *
FROM invoices;

SELECT COUNT(BillingCity)  -- NULL olanlar sayılmaz.
FROM invoices;

SELECT COUNT(BillingState)
FROM invoices;

/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren 
sorguyu yazınız*/

SELECT  COUNT(DISTINCT Composer) as num_of_composer
FROM tracks;

SELECT COUNT(BillingState)  -- NULL olanlar hariç saydırmak için bu kod kullanılır.
FROM invoices
WHERE BillingState IS NULL;

SELECT COUNT(*)   -- NULL olanları saydırmak için bu kod kullanılır.
FROM invoices
WHERE BillingState IS NULL;


-- MIN,MAX
-------------------------------------------------------------------------------------------------	
/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
sorguyu yaziniz */

SELECT name, MIN(Milliseconds) as min_duration
FROM tracks;

SELECT name as song_name, MIN(Milliseconds)/1000.0 as min_duration_sc
FROM tracks;

/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */

SELECT MIN(Grade) as min_grade, MAX(Grade) as max_grade
FROM students;

-- SUM,AVG
-------------------------------------------------------------------------------------------------	
/* invoices  tablosundaki faturaların toplam değerini listeyiniz */

SELECT SUM(total)
FROM invoices;


-- Sonucu yuvarlamak için  ROUND kullanılır.
SELECT ROUND(SUM(total)) 
FROM invoices;

/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */

SELECT ROUND(AVG(total), 3) as avg_amount 
FROM invoices;

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
şarkıların adlarını listeleyiniz */

SELECT ROUND(AVG(Milliseconds)) as avg_duration 
FROM tracks;

/*SELECT name, Milliseconds
FROM tracks 
WHERE Milliseconds > 393599.0*/

/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır 
sonraki bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/

SELECT name, Milliseconds
FROM tracks 
WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM tracks);

/*===================================================
 GROUP BY
====================================================*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */

SELECT Composer, COUNT(name)
FROM tracks
GROUP BY Composer;

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen ve NULL ları almayan sorguyu yazınız. */

SELECT Composer, COUNT(name)
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer;

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/

SELECT BillingCountry, ROUND(AVG(total), 2) as avg_total
FROM invoices
GROUP BY BillingCountry;

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile 2009-2011 ARASINDAKİLEİR listeleyen sorguyu yazınız.*/

SELECT BillingCountry, ROUND(AVG(total), 2) as avg_total
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31"
GROUP BY BillingCountry;