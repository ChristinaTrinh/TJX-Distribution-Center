CREATE TABLE insurance(insurance# NUMBER(3),
                       instype VARCHAR2(20), 
                       cost NUMBER(3), 
                       company VARCHAR2(25), 
                       coverageterm VARCHAR2(10),
                       CONSTRAINT insurance_insurance#_pk PRIMARY KEY(insurance#));

INSERT INTO insurance VALUES (100, 'Health Insurance', 100, 'State Farm Group', '2 years');
INSERT INTO insurance VALUES (200, 'Life Insurance', 300, 'MetLife', '5 years');
INSERT INTO insurance VALUES (300, 'Travel Insurance', 250, 'Progressive Ins Group', '5 years');
INSERT INTO insurance VALUES (400, 'Pet Insurance', 200, 'Marsh & McLennan', '3 years');
INSERT INTO insurance VALUES (500, 'Umbrella Insurance', 400, 'Prudential Financial', '3 years');

CREATE TABLE companies(company# NUMBER(2), 
                       companyname VARCHAR2(10), 
                       streetaddress VARCHAR2(20), 
                       city VARCHAR2(15), 
                       compstate VARCHAR2(2), 
                       zipcode NUMBER(5) CONSTRAINT companies_zipcode_nn NOT NULL,
                       CONSTRAINT companies_company#_pk PRIMARY KEY(company#));

INSERT INTO companies VALUES (25, 'Marshalls', '110 Meadow Glen', 'Medford', 'NH', 01245);
INSERT INTO companies VALUES (30, 'T.J.Maxx', '332 Swampton Ave', 'Melrose', 'MA', 12785);
INSERT INTO companies VALUES (35, 'HomeGoods', '520 Lunell Mady St', 'Malden', 'MA', 01953);
INSERT INTO companies VALUES (40, 'Sierra', '214 Central Ave ', 'Chelsea', 'NY', 15389);
INSERT INTO companies VALUES (45, 'Marshalls', '724 Canelly St', 'Cambridge', 'MA', 01473);
INSERT INTO companies VALUES (50, 'HomeSense', '145 Midsedy High', 'Lowell', 'CA', 19732);
INSERT INTO companies VALUES (55, 'Sierra', '563 Chapel Ave', 'Worcester', 'WY', 18237);
INSERT INTO companies VALUES (60, 'T.J.Maxx', '235 Kingya Central', 'Salem', 'NE', 07327);
INSERT INTO companies VALUES (65, 'HomeGoods', '234 West Street', 'Plymouth', 'AZ',03724);
INSERT INTO companies VALUES (70, 'HomeSense', '736 High Church Ave', 'Fall River', 'GA', 12745);
INSERT INTO companies VALUES (75, 'T.J.Maxx', '437 Northeastern St', 'Brockton', 'FL', 03829);
INSERT INTO companies VALUES (80, 'Marshalls', '832 Middlesex Ave', 'Quincy', 'TN', 28492);
INSERT INTO companies VALUES (85, 'Sierra', '327 Miegranty Ave', 'Framingham', 'KS', 04856);
INSERT INTO companies VALUES (90, 'HomeGoods', '274 School St', 'Waltham', 'MI', 02845);
INSERT INTO companies VALUES (95, 'T.J.Maxx', '5313 Vine St', 'New Bedford', 'NJ', 23783);

CREATE TABLE employees(employee# NUMBER(10), 
                       firstname VARCHAR2(15) CONSTRAINT employees_firstname_nn NOT NULL, 
                       lastname VARCHAR2(15) CONSTRAINT employees_lastname_nn NOT NULL, 
                       shift VARCHAR2(7) CONSTRAINT employees_shift_nn NOT NULL, 
                       datehired DATE NOT NULL, 
                       dateleave DATE, 
                       phone VARCHAR2(12), 
                       empstreet VARCHAR2(20), 
                       empcity VARCHAR2(15), 
                       empstate VARCHAR2(2), 
                       empzip VARCHAR2(5) CONSTRAINT employees_empzip_nn NOT NULL,
                       insurance# NUMBER(3),
                       company# NUMBER(2),
                       CONSTRAINT employees_employee#_pk PRIMARY KEY(employee#),
                       CONSTRAINT employees_insurance#_fk FOREIGN KEY(insurance#) REFERENCES insurance(insurance#),
                       CONSTRAINT employees_company#_fk FOREIGN KEY(company#) REFERENCES companies(company#),
                       CONSTRAINT employees_dateleave_ck CHECK (dateleave>datehired),
                       CONSTRAINT employees_phone_uk UNIQUE(phone));

INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112001, 'Alexia', 'King', 'Morning', TO_DATE('02-APR-2019','DD-MON-YYYY'),'781-687-7575','64 Fuller St','Malden', 'MA',01953,100,35);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112002, 'Jim', 'Green', 'Evening', TO_DATE('11-MAR-2015','DD-MON-YYYY'),'781-251-7383','173 Sargent St','Medford', 'NH',01245,200,25);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112003, 'Kristina', 'Cheng', 'Night', TO_DATE('28-MAY-2016','DD-MON-YYYY'),'781-638-7234','274 Broadway St','Melrose', 'MA',12785,300,30);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112004, 'Bobby', 'Smith', 'Morning', TO_DATE('23-JUL-2011','DD-MON-YYYY'),'781-782-7333','23 Hancock St','Chelsea', 'NY',15389,400,40);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112005, 'Nelly', 'Wood', 'Evening', TO_DATE('14-AUG-2015','DD-MON-YYYY'),'781-526-6392','234 Bryant St','Cambridge', 'MA',01473,500,45);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112006, 'Joanna', 'Szeing', 'Night', TO_DATE('17-FEB-2018','DD-MON-YYYY'),'781-264-8364','62 Lebanon St','Lowell', 'CA',19732,100,50);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112007, 'Nocial', 'Stone', 'Morning', TO_DATE('18-JUN-2019','DD-MON-YYYY'),'781-727-3624','494 Gore Rd','Worcester', 'WY',18237,200,55);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112008, 'Ruby', 'Lee', 'Evening', TO_DATE('05-APR-2020','DD-MON-YYYY'),'781-263-7284','184 Pierce St','Salem', 'NE',07327,300,60);
INSERT INTO employees VALUES (1001112009, 'Freda', 'Ford', 'Night',  TO_DATE('03-DEC-2015','DD-MON-YYYY'),TO_DATE('14-NOV-2021','DD-MON-YYYY'),'781-263-2845','284 Highland St','Plymouth', 'AZ',03724,400,65);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112010, 'Paul', 'Miller', 'Morning', TO_DATE('19-NOV-2013','DD-MON-YYYY'),'781-372-3728','245 Fellsway St','Fall River', 'GA',12745,500,70);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112011, 'Taylor', 'Nickol', 'Evening', TO_DATE('22-OCT-2012','DD-MON-YYYY'),'781-273-275','22 Spring St','Brockton', 'FL',03829,100,75);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112012, 'Obmar', 'Green', 'Night', TO_DATE('25-OCT-2011','DD-MON-YYYY'),'781-382-1845','124 Sylvan St','Quincy', 'TN',28492,200,80);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112013, 'Eric', 'Hoekstra', 'Morning', TO_DATE('27-AUG-2020','DD-MON-YYYY'),'781-273-2735','135 Belmont St','Framingham', 'KS',04856,300,85);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112014, 'Robert', 'Hally', 'Evening', TO_DATE('29-JAN-2021','DD-MON-YYYY'),'781-273-2749','275 Reservoir St','Waltham', 'MI',02845,400,90);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112015, 'Augustine', 'Ebron', 'Night', TO_DATE('16-JAN-2014','DD-MON-YYYY'),'781-284-1739','285 Henry St','New Bedford', 'NJ',23783,500,95);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112016, 'Miguel', 'Thomas', 'Morning', TO_DATE('14-MAY-2014','DD-MON-YYYY'),'781-173-1836','593 Harvard St','Malden', 'MA',01953,100,35);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112017, 'Orpha', 'Insley', 'Evening', TO_DATE('13-JUL-2015','DD-MON-YYYY'),'781-173-2835','25 Preston St','Plymouth', 'AZ',03724,200,65);
INSERT INTO employees VALUES (1001112018, 'Olivia', 'Hughes', 'Night', TO_DATE('12-MAR-2012','DD-MON-YYYY'),TO_DATE('10-OCT-2019','DD-MON-YYYY'),'781-184-1745','41 Alden St','Brockton', 'FL',03829,300,75);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112019, 'Sophia', 'Martinez', 'Morning', TO_DATE('11-DEC-2015','DD-MON-YYYY'),'781-271-2857','48 Newland St','Cambridge', 'MA',01473,400,45);
INSERT INTO employees(employee#,firstname,lastname,shift,datehired,phone,empstreet,empcity,empstate,empzip,insurance#,company#) VALUES (1001112020, 'Emma', 'Richardson', 'Evening', TO_DATE('08-NOV-2017','DD-MON-YYYY'),'781-173-2472','478 Grover St','Worcester', 'WY',18237,500,55);

CREATE TABLE products(product# NUMBER(5), 
                      prodname VARCHAR2(10), 
                      proddesc VARCHAR2(85), 
                      prodbrand VARCHAR2(15),
                      company# NUMBER(2),
                      CONSTRAINT products_product#_pk PRIMARY KEY(product#),
                      CONSTRAINT products_company#_fk FOREIGN KEY(company#) REFERENCES companies(company#));

INSERT INTO products VALUES(20001, 'Shoes','All types of shoes including crocs, sandals, sneakers','Nike',25);
INSERT INTO products VALUES(20002, 'Shirt','All types of shirts including t-shirt, long sleeve, sport bra','Micheal Kors',30);
INSERT INTO products VALUES(20003, 'Pants','All types of pants including jeans, jogger pants, boot-cut, swear pants, bush pants','Steve Madden',35);
INSERT INTO products VALUES(20004, 'Body Wash','Fragant and moisturizing body wash','Cuisinart',40);
INSERT INTO products VALUES(20005, 'Shampoo','Strengthens hair shampoo','Kohler',45);
INSERT INTO products VALUES(20006, 'Pan','Cooking non-stock pans','Cuisinart',50);
INSERT INTO products VALUES(20007, 'Bed','Comfortable beds for kids and adults','CoolGel',55);
INSERT INTO products VALUES(20008, 'Pillow','Comfortable pillows for kids and adults','CoolGel',60);
INSERT INTO products VALUES(20009, 'Blanket','Warm blankets for kids and adults','CoolGel',65);
INSERT INTO products VALUES(20010, 'Sofa','Sofa with different sizes for living room, office purposes','Gardner',70);
INSERT INTO products VALUES(20011, 'Shampoo','Strengthens hair shampoo','Kohler',75);
INSERT INTO products VALUES(20012, 'Body Wash','Fragant and moisturizing body wash','Kohler',80);
INSERT INTO products VALUES(20013, 'Pan','Cooking non-stock pans','Cuisinart',85);
INSERT INTO products VALUES(20014,  'Bed','Comfortable beds for kids and adults','CoolGel',90);
INSERT INTO products VALUES(20015, 'Sofa','Sofa with different sizes for living room, office purposes','Gardner',95);
INSERT INTO products VALUES(20016, 'Pan','Cooking non-stock pans','Cuisinart',25);
INSERT INTO products VALUES(20017, 'Shirt','All types of shirts including t-shirt, long sleeve, sport bra','Micheal Kors',30);
INSERT INTO products VALUES(20018, 'Shoes','All types of shoes including crocs, sandals, sneakers','Steve Madden',35);
INSERT INTO products VALUES(20019, 'Shampoo','Strengthens hair shampoo','Kohler',40);
INSERT INTO products VALUES(20020, 'Shampoo','Strengthens hair shampoo','Kohler',45);
INSERT INTO products VALUES(20021, 'Pillow','Comfortable pillows for kids and adults','CoolGel',50);
INSERT INTO products VALUES(20022, 'Blanket','Warm blankets for kids and adults','CoolGel',55);
INSERT INTO products VALUES(20023, 'Sofa','Sofa with different sizes for living room, office purposes','CoolGel',60);
INSERT INTO products VALUES(20024, 'Pants','All types of pants including jeans, jogger pants, boot-cut, swear pants, bush pants','Steve Madden',65);
INSERT INTO products VALUES(20025, 'Body Wash','Fragant and moisturizing body wash','Kohler',70);
INSERT INTO products VALUES(20026, 'Pants','All types of pants including jeans, jogger pants, boot-cut, swear pants, bush pants','Steve Madden',75);
INSERT INTO products VALUES(20027, 'Pan','Cooking non-stock pans','Cuisinart',80);
INSERT INTO products VALUES(20028, 'Body Wash','Fragant and moisturizing body wash','CoolGel',85);
INSERT INTO products VALUES(20029, 'Bed','Comfortable beds for kids and adults','CoolGel',90);
INSERT INTO products VALUES(20030, 'Shirt','All types of shirts including t-shirt, long sleeve, sport bra','Micheal Kors',95);
INSERT INTO products VALUES(20031, 'Pillow','Comfortable pillows for kids and adults','CoolGel',30);

CREATE TABLE contacts(contact# NUMBER(5), 
                      fname VARCHAR2(15) CONSTRAINT contacts_fname_nn NOT NULL, 
                      lname VARCHAR2(15) CONSTRAINT contacts_lname_nn NOT NULL, 
                      phonenum VARCHAR2(12), 
                      contcity VARCHAR2(15), 
                      contstate VARCHAR2(2), 
                      contzip NUMBER(5) CONSTRAINT contacts_contzip_nn NOT NULL,
                      CONSTRAINT contacts_contact#_pk PRIMARY KEY(contact#),
                      CONSTRAINT contacts_phonenum_uk UNIQUE(phonenum));

INSERT INTO contacts VALUES(30001, 'James','Gibson','781-328-2684','Malden','MA',01953);
INSERT INTO contacts VALUES(30002,'Lucas','Wood','781-284-2857', 'Chelsea','NY',15389);
INSERT INTO contacts VALUES(30003,'Rubby','King','781-372-1846','Brockton','FL',03829);
INSERT INTO contacts VALUES(30004,'Adriano','Marcato','781-189-1894','Waltham','MI',02845);
INSERT INTO contacts VALUES(30005,'Kate','Krishan','781-175-2742','New Bedford','NJ',23783);

CREATE TABLE brands(brand# NUMBER(5), 
                    brandname VARCHAR2(15), 
                    brandtype VARCHAR2(11),
                    contact# NUMBER(5),
                    CONSTRAINT brands_brand#_pk PRIMARY KEY(brand#),
                    CONSTRAINT brands_contact#_fk FOREIGN KEY(contact#) REFERENCES contacts(contact#));

INSERT INTO brands VALUES(41111,'Nike','Shoes',30001);
INSERT INTO brands VALUES(41112,'Steve Madden','Pants',30002);
INSERT INTO brands VALUES(41113,'Micheal Kors','Shirt',30002);
INSERT INTO brands VALUES(41114,'Cuisinart','Kitchen',30003);
INSERT INTO brands VALUES(41115,'Kohler','Bathroom',30004);
INSERT INTO brands VALUES(41116,'CoolGel','Bedroom',30005);
INSERT INTO brands VALUES(41117,'Gardner','Living Room',30005);

CREATE TABLE productbrand(product# NUMBER(5), 
                          brand# NUMBER(5),
                          CONSTRAINT productbrand_product#brand#_pk PRIMARY KEY(product#,brand#),
                          CONSTRAINT productbrand_product#_fk FOREIGN KEY(product#) REFERENCES products(product#),
                          CONSTRAINT productbrand_brand#_fk FOREIGN KEY(brand#) REFERENCES brands(brand#));

INSERT INTO productbrand VALUES(20001, 41111);
INSERT INTO productbrand VALUES(20002, 41113);
INSERT INTO productbrand VALUES(20003, 41112);
INSERT INTO productbrand VALUES(20004, 41114);
INSERT INTO productbrand VALUES(20005, 41115);
INSERT INTO productbrand VALUES(20006, 41114);
INSERT INTO productbrand VALUES(20007, 41116);
INSERT INTO productbrand VALUES(20008, 41116);
INSERT INTO productbrand VALUES(20009, 41116);
INSERT INTO productbrand VALUES(20010, 41117);
INSERT INTO productbrand VALUES(20011, 41115);
INSERT INTO productbrand VALUES(20012, 41115);
INSERT INTO productbrand VALUES(20013, 41114);
INSERT INTO productbrand VALUES(20014, 41116);
INSERT INTO productbrand VALUES(20015, 41117);
INSERT INTO productbrand VALUES(20016, 41114);
INSERT INTO productbrand VALUES(20017, 41113);
INSERT INTO productbrand VALUES(20018, 41112);
INSERT INTO productbrand VALUES(20019, 41115);
INSERT INTO productbrand VALUES(20020, 41115);
INSERT INTO productbrand VALUES(20021, 41116);
INSERT INTO productbrand VALUES(20022, 41116);
INSERT INTO productbrand VALUES(20023, 41116);
INSERT INTO productbrand VALUES(20024, 41112);
INSERT INTO productbrand VALUES(20025, 41115);
INSERT INTO productbrand VALUES(20026, 41112);
INSERT INTO productbrand VALUES(20027, 41114);
INSERT INTO productbrand VALUES(20028, 41116);
INSERT INTO productbrand VALUES(20029, 41116);
INSERT INTO productbrand VALUES(20030, 41113);
INSERT INTO productbrand VALUES(20031, 41116);
