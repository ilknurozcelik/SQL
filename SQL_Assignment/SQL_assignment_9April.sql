<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/user/OneDrive/Masaüstü/IT_FUNDAMENTALS_COURSE/SQL/chinook_db/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="5166"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,8:mainpersonel"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="bolumler" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="133"/><column index="2" value="139"/><column index="3" value="117"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="personel" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="118"/><column index="2" value="130"/><column index="3" value="110"/><column index="4" value="110"/><column index="5" value="142"/><column index="6" value="55"/><column index="7" value="91"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">CREATE TABLE bolumler(
			bolum_id INT,
			bolum_adi TEXT,
			konum TEXT,
			PRIMARY KEY (bolum_id)
			);
			
INSERT INTO bolumler VALUES(10, &quot;MUHASEBE&quot;, &quot;İSTANBUL&quot;);
INSERT INTO bolumler VALUES(20, &quot;MUDURLUK&quot;, &quot;ANKARA&quot;);
INSERT INTO bolumler VALUES(30, &quot;SATIS&quot;, &quot;İZMİR&quot;);
INSERT INTO bolumler VALUES(40, &quot;ISLETME&quot;, &quot;BURSA&quot;);
INSERT INTO bolumler VALUES(50, &quot;DEPO&quot;, &quot;YOZGAT&quot;);

CREATE TABLE personel(
			personel_id INT,
			personel_isim TEXT,
			meslek TEXT,
			mudur_id INT,
			ise_baslama date,
			maas INT,
			bolum_id INT,
			PRIMARY KEY (personel_id),
			FOREIGN KEY (bolum_id) REFERENCES bolumler(bolum_id)
			);

INSERT INTO personel VALUES(7369, &quot;AHMET&quot;, &quot;KATIP&quot;, 7902, &quot;1980-12-17&quot;, 800, 20);
INSERT INTO personel VALUES(7499, &quot;BAHATTIN&quot;, &quot;SATIS&quot;, 7698, &quot;1981-02-20&quot;, 1600, 30);
INSERT INTO personel VALUES(7521, &quot;NESE&quot;, &quot;SATIS&quot;, 7698, &quot;1981-02-22&quot;, 1250, 30);
INSERT INTO personel VALUES(7566, &quot;MUZAFFER&quot;, &quot;MUDUR&quot;, 7839, &quot;1981-04-02&quot;, 2975, 20);
INSERT INTO personel VALUES(7654, &quot;MUHAMMET&quot;, &quot;SATIS&quot;, 7698, &quot;1981-09-28&quot;, 1250, 30);
INSERT INTO personel VALUES(7698, &quot;EMINE&quot;, &quot;MUDUR&quot;, 7839, &quot;1981-05-01&quot;, 2850, 30);
INSERT INTO personel VALUES(7782, &quot;HARUN&quot;, &quot;MUDUR&quot;, 7839, &quot;1981-06-09&quot;, 2450, 10);
INSERT INTO personel VALUES(7788, &quot;MESUT&quot;, &quot;ANALIST&quot;, 7566, &quot;1987-07-13&quot;, 3000, 20);
INSERT INTO personel (personel_id, personel_isim, meslek, ise_baslama, maas, bolum_id)
				VALUES(7839, &quot;SEHER&quot;, &quot;BASKAN&quot;, &quot;1981-11-17&quot;, 5000, 10);
INSERT INTO personel VALUES(7844, &quot;DUYGU&quot;, &quot;SATIS&quot;, 7698, &quot;1981-09-08&quot;, 1500, 30);
INSERT INTO personel VALUES(7876, &quot;ALI&quot;, &quot;KATIP&quot;, 7788, &quot;1987-07-13&quot;, 1100, 20);
INSERT INTO personel VALUES(7900, &quot;MERVE&quot;, &quot;KATIP&quot;, 7788, &quot;1981-12-03&quot;, 950, 30);
INSERT INTO personel VALUES(7902, &quot;NAZLI&quot;, &quot;ANALIST&quot;, 7566, &quot;1981-12-03&quot;, 3000, 20);
INSERT INTO personel VALUES(7934, &quot;EBRU&quot;, &quot;KATIP&quot;, 7782, &quot;1982-01-23&quot;, 1300, 10);

/* SORGU1: SATIS veya MUHASABE bölümlerinde çalışan personelin isimlerini ve bölümlerini, 
önce bölüm sonra isim sıralı olarak listeleyiniz */

SELECT p.personel_isim, b.bolum_adi
FROM personel AS p
JOIN bolumler AS b
ON p.bolum_id = b.bolum_id
ORDER BY b.bolum_adi, p.personel_isim;




</sql><sql name="SQL 2">CREATE TABLE bolumler(
			bolum_id INT,
			bolum_adi TEXT,
			konum TEXT,
			PRIMARY KEY (bolum_id)
			);
			
INSERT INTO bolumler VALUES(10, &quot;MUHASEBE&quot;, &quot;İSTANBUL&quot;);
INSERT INTO bolumler VALUES(20, &quot;MUDURLUK&quot;, &quot;ANKARA&quot;);
INSERT INTO bolumler VALUES(30, &quot;SATIS&quot;, &quot;İZMİR&quot;);
INSERT INTO bolumler VALUES(40, &quot;ISLETME&quot;, &quot;BURSA&quot;);
INSERT INTO bolumler VALUES(50, &quot;DEPO&quot;, &quot;YOZGAT&quot;);

CREATE TABLE personel(
			personel_id INT,
			personel_isim TEXT,
			meslek TEXT,
			mudur_id INT,
			ise_baslama date,
			maas INT,
			bolum_id INT,
			PRIMARY KEY (personel_id),
			FOREIGN KEY (bolum_id) REFERENCES bolumler(bolum_id)
			);

INSERT INTO personel VALUES(7369, &quot;AHMET&quot;, &quot;KATIP&quot;, 7902, &quot;1980-12-17&quot;, 800, 20);
INSERT INTO personel VALUES(7499, &quot;BAHATTIN&quot;, &quot;SATIS&quot;, 7698, &quot;1981-02-20&quot;, 1600, 30);
INSERT INTO personel VALUES(7521, &quot;NESE&quot;, &quot;SATIS&quot;, 7698, &quot;1981-02-22&quot;, 1250, 30);
INSERT INTO personel VALUES(7566, &quot;MUZAFFER&quot;, &quot;MUDUR&quot;, 7839, &quot;1981-04-02&quot;, 2975, 20);
INSERT INTO personel VALUES(7654, &quot;MUHAMMET&quot;, &quot;SATIS&quot;, 7698, &quot;1981-09-28&quot;, 1250, 30);
INSERT INTO personel VALUES(7698, &quot;EMINE&quot;, &quot;MUDUR&quot;, 7839, &quot;1981-05-01&quot;, 2850, 30);
INSERT INTO personel VALUES(7782, &quot;HARUN&quot;, &quot;MUDUR&quot;, 7839, &quot;1981-06-09&quot;, 2450, 10);
INSERT INTO personel VALUES(7788, &quot;MESUT&quot;, &quot;ANALIST&quot;, 7566, &quot;1987-07-13&quot;, 3000, 20);
INSERT INTO personel (personel_id, personel_isim, meslek, ise_baslama, maas, bolum_id)
				VALUES(7839, &quot;SEHER&quot;, &quot;BASKAN&quot;, &quot;1981-11-17&quot;, 5000, 10);
INSERT INTO personel VALUES(7844, &quot;DUYGU&quot;, &quot;SATIS&quot;, 7698, &quot;1981-09-08&quot;, 1500, 30);
INSERT INTO personel VALUES(7876, &quot;ALI&quot;, &quot;KATIP&quot;, 7788, &quot;1987-07-13&quot;, 1100, 20);
INSERT INTO personel VALUES(7900, &quot;MERVE&quot;, &quot;KATIP&quot;, 7788, &quot;1981-12-03&quot;, 950, 30);
INSERT INTO personel VALUES(7902, &quot;NAZLI&quot;, &quot;ANALIST&quot;, 7566, &quot;1981-12-03&quot;, 3000, 20);
INSERT INTO personel VALUES(7934, &quot;EBRU&quot;, &quot;KATIP&quot;, 7782, &quot;1982-01-23&quot;, 1300, 10);

/* SORGU1: SATIS veya MUHASABE bölümlerinde çalışan personelin isimlerini ve bölümlerini, 
önce bölüm sonra isim sıralı olarak listeleyiniz */

SELECT p.personel_isim, b.bolum_adi
FROM personel AS p
JOIN bolumler AS b
ON p.bolum_id = b.bolum_id
WHERE b.bolum_adi = &quot;SATIS&quot; OR b.bolum_adi = &quot;MUHASEBE&quot;
ORDER BY b.bolum_adi, p.personel_isim;

/* SORGU2: SATIS, ISLETME ve DEPO bölümlerinde çalışan personelin isimlerini, bölümlerini ve 
işe başlama tarihlerini isim sıralı olarak listeleyiniz. 
NOT: Çalışanı olmasa bile bölüm ismi gösterilmelidir.*/

SELECT p.personel_isim, b.bolum_adi, p.ise_baslama
FROM bolumler AS b
LEFT JOIN personel AS p
ON b.bolum_id = p.bolum_id
WHERE b.bolum_adi = &quot;SATIS&quot; OR b.bolum_adi = &quot;ISLETME&quot; OR b.bolum_adi = &quot;DEPO&quot;
ORDER BY p.personel_isim;

/* SORGU3: Tüm bölümlerde çalışan personelin isimlerini, bölüm isimlerini ve maaşlarını bölüm
ve maaş sıralı listeleyiniz. 
NOT: Çalışanı olmasa bile bölüm ismi gösterilmelidir. */

SELECT p.personel_isim, b.bolum_adi, p.maas
FROM bolumler AS b
LEFT JOIN personel AS p
ON b.bolum_id = p.bolum_id
ORDER BY b.bolum_adi, p.maas;

/* SORGU4: SATIS ve MUDURLUK bölümlerinde çalışan personelin maaşları 2000'den büyük
olanlarının isim, bölüm ve maaş bilgilerini bolüme ve isme göre sıralayarak listeleyiniz. */

SELECT p.personel_isim, b.bolum_adi, p.maas
FROM personel AS p
JOIN bolumler AS b
ON p.bolum_id = b. bolum_id
WHERE b.bolum_adi = &quot;SATIS&quot; OR b.bolum_adi = &quot;MUDURLUK&quot;
ORDER BY b.bolum_adi, p.personel_isim;

/* SORGU5: MUDUR'u Muzaffer veya Emine olan personelin bölümlerini, isimlerini, maaşlarını ve 
mudur isimlerini maaş sıralı olarak (Çoktan aza) listeleyiniz */

SELECT bolum_id, personel_isim FROM personel WHERE meslek = &quot;MUDUR&quot; AND (personel_isim = &quot;MUZAFFER&quot; OR personel_isim = &quot;EMINE&quot;);


SELECT b.bolum_adi, p.personel_isim, p.meslek, p.maas, p.bolum_id
FROM personel AS p
JOIN bolumler AS b
ON p.bolum_id = b. bolum_id
WHERE p.bolum_id 
IN (SELECT bolum_id FROM personel WHERE meslek = &quot;MUDUR&quot; AND (personel_isim = &quot;MUZAFFER&quot; OR personel_isim = &quot;EMINE&quot;))
ORDER BY p.maas DESC;


</sql><current_tab id="1"/></tab_sql></sqlb_project>
