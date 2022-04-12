<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/user/OneDrive/Masaüstü/IT_FUNDAMENTALS_COURSE/SQL/chinook_db/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="5166"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,6:mainpeople"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="employees" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="112"/><column index="2" value="95"/><column index="3" value="97"/><column index="4" value="157"/><column index="5" value="98"/><column index="6" value="162"/><column index="7" value="162"/><column index="8" value="228"/><column index="9" value="85"/><column index="10" value="55"/><column index="11" value="78"/><column index="12" value="106"/><column index="13" value="148"/><column index="14" value="148"/><column index="15" value="214"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="people" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="160"/><column index="2" value="222"/><column index="3" value="271"/><column index="4" value="106"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="personel" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="103"/><column index="2" value="99"/><column index="3" value="52"/><column index="4" value="92"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="vacation_plan" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort><column index="3" mode="0"/></sort><column_widths><column index="1" value="82"/><column index="2" value="115"/><column index="3" value="225"/><column index="4" value="197"/><column index="5" value="206"/><column index="6" value="71"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="vacation_plan2" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="90"/><column index="2" value="119"/><column index="3" value="169"/><column index="4" value="120"/><column index="5" value="149"/><column index="6" value="71"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="workers" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort><column index="1" mode="0"/></sort><column_widths><column index="1" value="173"/><column index="2" value="177"/><column index="3" value="132"/><column index="4" value="193"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*------------------------------------------------------------------------------------------
/*  CREATE TABLE
/*------------------------------------------------------------------------------------------
	
/*personel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
age(INT) ve hire_date (Date) sutunuları bulunmalıdır.	*/

CREATE TABLE personel(
			first_name TEXT,
			last_name TEXT,
			age INT,
			hire_date date
			);
			
/* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir. Bu hatayı
almamak için IF NOT EXISTS keywordu kullanılabilir */

CREATE TABLE IF NOT EXIST personel(
			first_name TEXT,
			last_name TEXT,
			age INT,
			hire_date date
			);

/*Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  Sutun isimleri
place_id, country, hotel_name, employee_id, vacation_length,budget 	*/

CREATE TABLE vacation_plan(
			place_id INT,
			country NVARCHAR(50),  -- 50 KARAKTER
			hotel_name NVARCHAR(100),  -- 100 KARAKTER
			employee_id INTEGER,
			vacation_length INT,
			budget NUMERIC(7,2)   --NOKTADAN ÖNCE 7 BASAMAK, NOKTADAN SONRA 2 BASAMAK
			);

			
/*------------------------------------------------------------------------------------------
/*  DROP TABLE
/*------------------------------------------------------------------------------------------
/* personel tablosunu siliniz */

DROP TABLE personel;

/* Bir tabloyu silerken tablo bulunamazsa hata verir.
 Bu hatayı görmemek için IF EXISTS keywordu kullanılabilir.*/
 
DROP TABLE IF EXISTS personel;

-- NOT: SQL'de TRUNCATE TABLE komutu bulunmasına karşın SQLite bu komutu 
-- desteklememektedir. Truncate komutu  bir tabloyu değil içindeki tüm verileri 
-- silmek için kullanılır.

TRUNCATE TABLE vacation_plan;  -- bu komut SQlite da çalışmıyor.

INSERT INTO vacation_plan VALUES(34, &quot;TURKEY&quot;, &quot;HOTEL ISTANBUL&quot;, 5, 7, 4000);
-- NOT: Aynı komut tekrar çalıştırılırsa herhangi bir kısıt yoksa ise aynı veriler
-- tekrar tabloya girilmiş olur.
INSERT INTO vacation_plan VALUES(42, &quot;TURKEY&quot;, &quot;HOTEL MEVLANA&quot;, 2, 4, 2000);

-- SADECE KISITLI VERİ GİRMEK İSTİYORSAK ALTTAKİ GİBİ KOMUT YAZMALIYIZ.
-- VERİ GİRİLECEK ALANLARIN İSİMLERİ BELİRTİLMELİ.
INSERT INTO vacation_plan (place_id, country, hotel_name, employee_id)
						VALUES(06, &quot;TURKEY&quot;, &quot;HOTEL ANKARA&quot;, 3);

-- veri girişi yapmadışımız sütünlara NULL ekleniyor.

/*------------------------------------------------------------------------------------------
/*  CONSTRAINTS - KISITLAMALAR 
/*-----------------------------------------------------------------------------------------

NOT NULL - Bir Sütunun NULL içermemesini garanti eder. 

UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  

PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
 BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)

FOREIGN KEY - Başka bir tablodaki Primary Key'i referans göstermek için kullanılır. 
 Böylelikle, tablolar arasında ilişki kurulmuş olur. 

 DEFAULT - Herhangi bir değer atanmadığında Başlangıç değerinin atanmasını sağlar. */
 
 
CREATE TABLE workers (
			id INT PRIMARY KEY,
			İd_number TEXT NOT NULL UNIQUE,
			name TEXT DEFAULT &quot;NONAME&quot;,
			salary INT NOT NULL
			);
			
INSERT INTO workers VALUES(1, 25678941625, &quot;Can Canan&quot;, 10000);
--PRIMARY KEY e aynı ıd ile yeni bir değer girilemez. Hata verir.
--	unıque constraint violation
INSERT INTO workers VALUES(1, 24678978255, &quot;Ahmet Canan&quot;, 12000);

INSERT INTO workers VALUES(3, 22455677890, NULL, 14000);

INSERT INTO workers (id, İd_number, salary) VALUES(4, 66655544433, 14000);


/*vacation_plan tablosunu place_id sutunu PK ve employee_id sutununu 
ise FK olarak  değiştirirek vacation_plan2 adinda yeni bir tablo oluşturunuz.
Bu tablo, employees tablosu ile ilişkili olmalıdır */ 

CREATE TABLE vacation_plan2 (
			place_id INT,
			country NVARCHAR(50),
			hotel_name NVARCHAR(100),
			employee_id INTEGER,
			vacation_length INT,
			budget REAL,
			PRIMARY KEY (place_id),
			FOREIGN KEY (employee_id)
			REFERENCES employees(EmployeeId)
			);

/* Employees tablosundaki EmployeeId'si 1 olan kişi için bir tatil planı giriniz.*/

INSERT INTO vacation_plan2 VALUES (34, &quot;TURKEY&quot;, &quot;HAPPY NATION&quot;, 1, 5, 5400);

/* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) olan kişi için bir tatil planı giriniz.*/

INSERT INTO vacation_plan2 VALUES (35, &quot;TURKEY&quot;, &quot;HAPPY DELRAY&quot;, 9, 8, 10600);			
-- burada diğer tabloda olmayan 9 nolu employee girmeye çalıştığımız zaman hata(FOREIGN KEY constraint failed hatası) verdi.

/*JOIN işlemi ile 2 tablodan veri çekme*/

SELECT e.FirstName, e.LastName, e.vacation_length, v.hotel_name
FROM employees AS e
JOIN vacation_plan2 AS v
ON e.EmployeeId = v.employee_id;

*------------------------------------------------------------------------------------------
/*  ALTER TABLE (ADD, RENAME TO, DROP)
/*  SQLITE MODIFY VE DELETE KOMUTLARINI DOĞRUDAN DESTEKLENMEZ
/*------------------------------------------------------------------------------------------
	
/*vacation_plan2 tablosuna name adında ve DEFAULT değeri noname olan 
yeni bir sutun ekleyelim */

ALTER TABLE vacation_plan2
ADD name TEXT DEFAULT &quot;İSİMSİZ&quot;;

ALTER TABLE vacation_plan2
DROP COLUMN name;

ALTER TABLE workers
RENAME TO people;

*------------------------------------------------------------------------------------------
/*  UPDATE,DELETE
-- SYNTAX
----------
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE koşul;
		
--DELETE tablo_adı
--WHERE koşul;
/*-----------------------------------------------------------------------------------------*/
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydini  hotel_name'ini Komagene Hotel olarak
güncelleyiniz.*/
   
UPDATE vacation_plan2
SET hotel_name = 'Komagene Hotel'
WHERE employee_id = 1;
   
/* people tablosunda salary sutunu 7000 'den az olanların salary(maaşına)
%20 zam yapacak sorguyu yazınız*/ 
   
UPDATE people
SET salary = salary*1.2
WHERE salary &lt; 11000;
   
/*people tablosundaki tüm kayıtkarın salary sutununu 10000 olarak güncelleyiniz */
UPDATE people
SET salary=10000;
   
/*people tablosundaki id=1 olan kaydı siliniz*/
DELETE FROM people
WHERE id=1;
  






</sql><current_tab id="0"/></tab_sql></sqlb_project>
