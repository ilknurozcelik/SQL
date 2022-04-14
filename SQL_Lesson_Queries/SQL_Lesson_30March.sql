<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/user/OneDrive/Masaüstü/IT_FUNDAMENTALS_COURSE/SQL/chinook_db/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="5166"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,8:maininvoices"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort><column index="1" mode="0"/></sort><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="artists" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="76"/><column index="2" value="300"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="clients" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="86"/><column index="2" value="97"/><column index="3" value="95"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="employees" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="112"/><column index="2" value="95"/><column index="3" value="97"/><column index="4" value="157"/><column index="5" value="98"/><column index="6" value="162"/><column index="7" value="162"/><column index="8" value="228"/><column index="9" value="85"/><column index="10" value="55"/><column index="11" value="78"/><column index="12" value="106"/><column index="13" value="148"/><column index="14" value="148"/><column index="15" value="214"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="invoices" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="93"/><column index="2" value="111"/><column index="3" value="162"/><column index="4" value="300"/><column index="5" value="167"/><column index="6" value="109"/><column index="7" value="132"/><column index="8" value="160"/><column index="9" value="53"/></column_widths><filter_values><column index="3" value="2013"/></filter_values><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="students" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="105"/><column index="2" value="97"/><column index="3" value="95"/><column index="4" value="61"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="tracks" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="75"/><column index="2" value="300"/><column index="3" value="84"/><column index="4" value="121"/><column index="5" value="80"/><column index="6" value="300"/><column index="7" value="115"/><column index="8" value="79"/><column index="9" value="88"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL_Lesson_01April.sqbpro.sql">/*===================================================
WHERE
====================================================*/
/*Composer ı Jimi Hendrix olan şarkıları sorgulayınız.*/

SELECT name, Milliseconds 
FROM tracks
WHERE Composer = &quot;Jimi Hendrix&quot;;

/* invoices tablosunda Total değeri 10$ dan büyük olan faturaların tüm bilgilerini 
sorgulayiniz */

SELECT * FROM invoices WHERE Total &gt; 10;

/*===================================================
LIMIT
====================================================*/
/*invoices tablosunda Total değeri 10$'dan büyük olan 
ilk 4 kayıt'ın InvoiceId,InvoiceDate ve total 
bilgilerini sorgulayiniz */

SELECT InvoiceId, InvoiceDate, total FROM invoices WHERE Total &gt; 10 LIMIT 4;

/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */ 

SELECT * FROM invoices WHERE total &gt; 10 ORDER BY InvoiceDate DESC LIMIT 10;

/*In voice tablosundan customerId, Invoicedate, BillingCity ve Total değerlerini bİLLİNGCİTY YE GÖRE ARTAN BİR ŞEKİLDE SIRALA,
TOTAL i AZALAN BİR ŞEKİLDE SIRALAyarak getiren bir sorgu yazınız*/

SELECT CustomerId, InvoiceDate, BillingCity, total
FROM invoices
ORDER BY BillingCity, total DESC;
/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
göre  AZALAN sırada listeyiniz */ 

SELECT *
FROM invoices
WHERE NOT BillingCountry = &quot;USA&quot;
--WHERE BillingCountry != &quot;USA&quot;
--WHERE BillingCountry &lt;&gt; &quot;USA&quot;
ORDER BY total DESC;

/* invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
InvoiceId sırasına göre artan sırada listeyiniz */ 

SELECT *
FROM invoices
WHERE BillingCountry = &quot;USA&quot; OR BillingCountry = &quot;Germany&quot;
ORDER BY InvoiceId;

/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */ 

SELECT *
FROM invoices
WHERE InvoiceDate &gt;= &quot;2012-01-01&quot; AND InvoiceDate &lt;= &quot;2013-01-02&quot;;

/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
tarihleri arasındaki faturaların tüm bilgilerini BETWEEN operatörü kullanarak 
listeleyiniz */ 

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN &quot;2012-01-01&quot; AND &quot;2013-01-02&quot;;

* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 tarihleri arasındaki
en yeni faturayı listeleyen sorguyu yazınız */

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN &quot;2009-01-01&quot; AND &quot;2011-12-31 23:59:59&quot; ORDER BY InvoiceDate DESC LIMIT 1;


/*===================================================
IN
====================================================*/
/* customers tablosunda Belgium, Norway veya  Canada ,USA  ülkelerinden sipariş veren
müşterilerin FirstName, LastName, country bilgilerini listeyiniz	*/

SELECT FirstName, LastName, country
FROM customers
WHERE country IN (&quot;Belgium&quot;, &quot;Norway&quot;, &quot;Canada&quot;, &quot;USA&quot;);</sql><sql name="SQL 1 (1)">/* Bu bir yorum satırıdır */
-- Bu da bir yorum satırıdır.

/* track tablosundaki track isimlerini(name) sorgulayınız */
CT name FROM tracks;

/* track tablosundaki besteci(Composer) ve şarkı isimlerini(name) sorgulayınız*/

SELECT Composer, name FROM tracks;

SELECT * FROM tracks;

SELECT * FROM albums;

SELECT DISTINCT Composer FROM tracks;

SELECT DISTINCT AlbumId, MediaTypeId  FROM tracks;</sql><current_tab id="0"/></tab_sql></sqlb_project>
