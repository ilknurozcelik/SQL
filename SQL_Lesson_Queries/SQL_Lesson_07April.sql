<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/user/OneDrive/Masaüstü/IT_FUNDAMENTALS_COURSE/SQL/araclar_db/araclar.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached><db schema="chinook" path="C:\Users\user\OneDrive\Masaüstü\IT_FUNDAMENTALS_COURSE\SQL\chinook_db\chinook (1).db"/></attached><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="2057"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/><expanded_item id="4" parent="1"/></tab_structure><tab_browse><current_table name="7,6:chinooktracks"/><default_encoding codec=""/><browse_table_settings><table schema="chinook" name="tracks" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="75"/><column index="2" value="300"/><column index="3" value="84"/><column index="4" value="121"/><column index="5" value="80"/><column index="6" value="300"/><column index="7" value="115"/><column index="8" value="79"/><column index="9" value="88"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="markalar" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="90"/><column index="2" value="100"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">/*===================================================
 JOINS
====================================================*/
    
-- Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
-- olusturmak icin kullanilabilir.
--     
-- JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
-- Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
-- icin JOIN islemleri kullanilabilir.

-- Standart SQL'de en çok kullanılan Join islemleri:
-- 1) FULL JOIN:  Tablodaki tum sonuclari gosterir
-- 2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
-- 3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
-- 4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--	NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
/*===================================================*/


/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/

select * from markalar;

/* BURADA INNER JOIN YAPARAK SADECE KESİŞEN VERİLERİ İÇEREN BİR TABLO ELDE ETTİK */

SELECT markalar.marka_id, markalar.marka_adi, siparisler.siparis_adedi, siparisler.siparis_tarihi
FROM markalar
INNER JOIN siparisler ON markalar.marka_id = siparisler.marka_id;

/* LEFT JOIN YAPARSAK NASIL BİR TABLO OLUŞUR?  
SOLDAKİ TABLODAKİ VERİLERİN TAMAMI GELİR. 
SAĞDAKİ TABLODA KARŞILIĞI OLMAYAN VERİLERİN KAŞILIĞI NULL OLUR.*/

SELECT markalar.marka_id, markalar.marka_adi, siparisler.siparis_adedi, siparisler.siparis_tarihi
FROM markalar
LEFT JOIN siparisler ON markalar.marka_id = siparisler.marka_id;

/* daha kısa olarak 
tablo isimlerini kısaltarak aşağıdaki gibi de sorgu yazılabilir*/

SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
FROM markalar AS m
LEFT JOIN siparisler AS s ON m.marka_id = s.marka_id;

/* Markalar ve Siparisler tablolarındaki tüm araç markalarının siparis bilgilerini
(marka_id,marka_adi,siparis_adedi,siparis_tarihi) listeleyen bir sorgu yaziniz.*/

SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
FROM markalar AS m
LEFT JOIN siparisler AS s
ON m.marka_id = s.marka_id;

/* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının
türünü (genre) listeleyiniz.*/

select * from tracks;

SELECT t.name, g.name
FROM tracks AS t
JOIN genres AS g
ON t.GenreId = g. GenreId;

/* invoice tablosundaki faturaların her birinin müşteri adını
 (FirstName),soyadını (lastName), fatura tarihini (InvoiceDate)
 ve fatura meblağını (total) listeleyen sorguyu yazınız */
 
select * FROM invoices;

SELECT c.FirstName, c. LastName, i.InvoiceDate, i.total
FROM invoices AS i
JOIN customers AS c
ON i.CustomerId = c.CustomerId;

/* isime göre gruplandırarak yaparsak */

SELECT c.FirstName, c. LastName, i.InvoiceDate, i.total
FROM invoices AS i
JOIN customers AS c
ON i.CustomerId = c.CustomerId
GROUP BY c.FirstName;

/* Hem isime göre gruplandırıp, hem de total leri toplarsak daha mantıklı olur. */

SELECT c.FirstName, c. LastName, i.InvoiceDate, SUM(i.total) AS total_amount
FROM invoices AS i
JOIN customers AS c
ON i.CustomerId = c.CustomerId
GROUP BY c.FirstName;

/* invoice tablosundaki faturaların her birinin müşteri adını 
(FirstName),soyadını(lastName) ve fatura meblağlarının 
toplamının(total) 40 dolardan fazla olanlarını azalan sırada
listeleyen sorguyu yazınız */

SELECT c.FirstName, c. LastName, i.InvoiceDate, SUM(i.total) AS total_amount
FROM invoices AS i
JOIN customers AS c
ON i.CustomerId = c.CustomerId
GROUP BY c.FirstName
HAVING total_amount &gt; 40
ORDER BY total_amount DESC;

/* Alternatif olarak CustomerId ye göre gruplandırdığımızda
 kod aşağıdaki gibi olmalı. */

SELECT c. CustomerId, c.FirstName, c. LastName, i.InvoiceDate, SUM(i.total) AS total_amount
FROM invoices AS i
JOIN customers AS c
ON i.CustomerId = c.CustomerId
GROUP BY c.CustomerId
HAVING total_amount &gt; 40
ORDER BY total_amount DESC;

/*===================================================
 SUBQUERIES
====================================================*/

/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */

SELECT AlbumId FROM albums WHERE title = &quot;Faceless&quot;;

/* hard coded yöntem */
SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId = 88;

/* SUBQUERY KULLANILARAK */
SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId =(SELECT AlbumId FROM albums WHERE title = &quot;Faceless&quot;);

/* JOIN METODU İLE */

SELECT t.TrackId, t.name, t.AlbumId
FROM tracks AS t
JOIN albums AS a
ON t.AlbumId = a.AlbumId
WHERE a.Title = &quot;Faceless&quot;;

/* alternatif :where kullanmadan */

SELECT t.TrackId, t.name, t.AlbumId
FROM tracks AS t
JOIN albums AS a
ON t.AlbumId = a.AlbumId AND a.Title = &quot;Faceless&quot;;

--ÖDEVLER--

/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */



/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
JOIN kullanarak listeyiniz.Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */

</sql><current_tab id="0"/></tab_sql></sqlb_project>
