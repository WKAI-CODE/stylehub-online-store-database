--
-- PostgreSQL database dump
--

\restrict UAbJNlTamHoSlggkq9FNPumajOXeLDq4zuXpdFRqtCnR2LTV88jDkwdyBumir04

-- Dumped from database version 17.9
-- Dumped by pg_dump version 17.9

-- Started on 2026-07-22 17:07:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16768)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    adminid character varying(10) NOT NULL,
    adminfirstname character varying(100),
    adminlastname character varying(100),
    adminemail character varying(100),
    password character varying(100),
    role character varying(100)
);


--
-- TOC entry 218 (class 1259 OID 16773)
-- Name: cart_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_item (
    cartitemid character varying(10) NOT NULL,
    shoppingcartid character varying(10),
    productvariantid character varying(10),
    quantity integer
);


--
-- TOC entry 219 (class 1259 OID 16776)
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    categoryid character varying(10) NOT NULL,
    categoryname character varying(100)
);


--
-- TOC entry 220 (class 1259 OID 16779)
-- Name: customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer (
    customerid character varying(10) NOT NULL,
    name character varying(100),
    emailaddress character varying(100),
    address character varying(100),
    phonenumber character varying(20)
);


--
-- TOC entry 221 (class 1259 OID 16782)
-- Name: delivery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery (
    deliveryid character varying(10) NOT NULL,
    orderid character varying(10) NOT NULL,
    courierservice character varying(100),
    trackingno character varying(100),
    deliverystatus character varying(100),
    shippeddate date,
    deliverydate date,
    deliveryaddress text
);


--
-- TOC entry 222 (class 1259 OID 16787)
-- Name: feedback; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feedback (
    feedbackid character varying(10) NOT NULL,
    orderid character varying(10),
    productvariantid character varying(10),
    rating integer,
    comment character varying(1000),
    reviewdate date
);


--
-- TOC entry 223 (class 1259 OID 16792)
-- Name: order_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_product (
    orderproductid character varying(10) NOT NULL,
    orderid character varying(10) NOT NULL,
    productvariantid character varying(10) NOT NULL,
    quantity integer
);


--
-- TOC entry 224 (class 1259 OID 16795)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    orderid character varying(10) NOT NULL,
    customerid character varying(10) NOT NULL,
    shoppingcartid character varying(10) NOT NULL,
    orderdate date,
    ordertime time without time zone,
    totalamount numeric(10,2),
    paymentmethod character varying(50),
    orderstatus character varying(50)
);


--
-- TOC entry 225 (class 1259 OID 16798)
-- Name: payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment (
    paymentid character varying(10) NOT NULL,
    orderid character varying(10) NOT NULL,
    paymentdate date,
    paymentamount numeric(10,2) NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16801)
-- Name: product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product (
    productid character varying(10) NOT NULL,
    categoryid character varying(10),
    adminid character varying(10),
    productname character varying(300) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 16806)
-- Name: product_variant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_variant (
    productvariantid character varying(10) NOT NULL,
    productid character varying(10) NOT NULL,
    size character varying(50),
    color character varying(50),
    stockquantity integer
);


--
-- TOC entry 228 (class 1259 OID 16809)
-- Name: shopping_cart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shopping_cart (
    shoppingcartid character varying(10) NOT NULL,
    customerid character varying(10),
    cartdate date
);


--
-- TOC entry 4968 (class 0 OID 16768)
-- Dependencies: 217
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (adminid, adminfirstname, adminlastname, adminemail, password, role) VALUES ('A001', 'Ahmad', 'Rahman', 'ahmad.rahman@email.com', 'ahmad123', 'SuperAdmin');
INSERT INTO public.admin (adminid, adminfirstname, adminlastname, adminemail, password, role) VALUES ('A002', 'Siti', 'Aminah', 'siti.aminah@email.com', 'siti456', 'Manager');
INSERT INTO public.admin (adminid, adminfirstname, adminlastname, adminemail, password, role) VALUES ('A003', 'Nurul', 'Hassan', 'nurul.hassan@email.com', 'nurul789', 'Staff');
INSERT INTO public.admin (adminid, adminfirstname, adminlastname, adminemail, password, role) VALUES ('A004', 'Muhammad', 'Faiz', 'muhammad.faiz@email.com', 'faiz321', 'Manager');
INSERT INTO public.admin (adminid, adminfirstname, adminlastname, adminemail, password, role) VALUES ('A005', 'Aisyah', 'Zulkifli', 'aisyah.zulkifli@email.com', 'aisyah654', 'Staff');


--
-- TOC entry 4969 (class 0 OID 16773)
-- Dependencies: 218
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cart_item (cartitemid, shoppingcartid, productvariantid, quantity) VALUES ('CI001', 'SC001', 'PV001', 1);
INSERT INTO public.cart_item (cartitemid, shoppingcartid, productvariantid, quantity) VALUES ('CI002', 'SC002', 'PV002', 2);
INSERT INTO public.cart_item (cartitemid, shoppingcartid, productvariantid, quantity) VALUES ('CI003', 'SC003', 'PV003', 1);
INSERT INTO public.cart_item (cartitemid, shoppingcartid, productvariantid, quantity) VALUES ('CI004', 'SC004', 'PV004', 1);
INSERT INTO public.cart_item (cartitemid, shoppingcartid, productvariantid, quantity) VALUES ('CI005', 'SC005', 'PV005', 1);
INSERT INTO public.cart_item (cartitemid, shoppingcartid, productvariantid, quantity) VALUES ('CI006', 'SC006', 'PV006', 2);
INSERT INTO public.cart_item (cartitemid, shoppingcartid, productvariantid, quantity) VALUES ('CI007', 'SC007', 'PV003', 1);


--
-- TOC entry 4970 (class 0 OID 16776)
-- Dependencies: 219
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.category (categoryid, categoryname) VALUES ('CAT001', 'Dresses');
INSERT INTO public.category (categoryid, categoryname) VALUES ('CAT002', 'Jeans');
INSERT INTO public.category (categoryid, categoryname) VALUES ('CAT003', 'Jackets');
INSERT INTO public.category (categoryid, categoryname) VALUES ('CAT004', 'Shirts');
INSERT INTO public.category (categoryid, categoryname) VALUES ('CAT005', 'Accessories');


--
-- TOC entry 4971 (class 0 OID 16779)
-- Dependencies: 220
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customer (customerid, name, emailaddress, address, phonenumber) VALUES ('C001', 'Aisha', 'aisha@gmail.com', 'Kuala Lumpur, Malaysia', '012-3456789');
INSERT INTO public.customer (customerid, name, emailaddress, address, phonenumber) VALUES ('C002', 'Daniel', 'daniel@gmail.com', 'Petaling Jaya, Malaysia', '013-4567890');
INSERT INTO public.customer (customerid, name, emailaddress, address, phonenumber) VALUES ('C003', 'Mei Ling', 'meiling@gmail.com', 'Subang Jaya, Malaysia', '014-5678901');
INSERT INTO public.customer (customerid, name, emailaddress, address, phonenumber) VALUES ('C004', 'Raj', 'raj@gmail.com', 'Cheras, Malaysia', '015-6789012');
INSERT INTO public.customer (customerid, name, emailaddress, address, phonenumber) VALUES ('C005', 'Siti', 'siti@gmail.com', 'Shah Alam, Malaysia', '016-7890123');


--
-- TOC entry 4972 (class 0 OID 16782)
-- Dependencies: 221
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.delivery (deliveryid, orderid, courierservice, trackingno, deliverystatus, shippeddate, deliverydate, deliveryaddress) VALUES ('D001', 'O001', 'PosLaju', 'PL123456MY', 'Delivered', '2026-05-01', '2026-05-03', 'Kuala Lumpur, Malaysia');
INSERT INTO public.delivery (deliveryid, orderid, courierservice, trackingno, deliverystatus, shippeddate, deliverydate, deliveryaddress) VALUES ('D002', 'O002', 'J&T Express', 'JT654321MY', 'Shipped', '2026-05-02', '2026-05-05', 'Shah Alam, Selangor');
INSERT INTO public.delivery (deliveryid, orderid, courierservice, trackingno, deliverystatus, shippeddate, deliverydate, deliveryaddress) VALUES ('D003', 'O003', 'DHL eCommerce', 'DHL789456MY', 'Pending', '2026-05-04', NULL, 'Johor Bahru, Johor');
INSERT INTO public.delivery (deliveryid, orderid, courierservice, trackingno, deliverystatus, shippeddate, deliverydate, deliveryaddress) VALUES ('D004', 'O004', 'Ninja Van', 'NV321654MY', 'Delivered', '2026-05-05', '2026-05-07', 'Ipoh, Perak');
INSERT INTO public.delivery (deliveryid, orderid, courierservice, trackingno, deliverystatus, shippeddate, deliverydate, deliveryaddress) VALUES ('D005', 'O005', 'City-Link Express', 'CL987123MY', 'Out for Delivery', '2026-05-06', NULL, 'Kota Bharu, Kelantan');
INSERT INTO public.delivery (deliveryid, orderid, courierservice, trackingno, deliverystatus, shippeddate, deliverydate, deliveryaddress) VALUES ('D006', 'O006', 'PosLaju', 'PL456789MY', 'Delivered', '2026-05-10', '2026-05-12', 'Kuala Lumpur, Malaysia');
INSERT INTO public.delivery (deliveryid, orderid, courierservice, trackingno, deliverystatus, shippeddate, deliverydate, deliveryaddress) VALUES ('D007', 'O007', 'J&T Express', 'JT987654MY', 'Processing', '2026-05-15', NULL, 'Kuala Lumpur, Malaysia');


--
-- TOC entry 4973 (class 0 OID 16787)
-- Dependencies: 222
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.feedback (feedbackid, orderid, productvariantid, rating, comment, reviewdate) VALUES ('F001', 'O001', 'PV001', 5, 'Excellent product, very satisfied!', '2026-05-02');
INSERT INTO public.feedback (feedbackid, orderid, productvariantid, rating, comment, reviewdate) VALUES ('F002', 'O002', 'PV002', 4, 'Good quality but delivery was slow.', '2026-05-04');
INSERT INTO public.feedback (feedbackid, orderid, productvariantid, rating, comment, reviewdate) VALUES ('F003', 'O003', 'PV003', 3, 'Average experience, product is okay.', '2026-05-06');
INSERT INTO public.feedback (feedbackid, orderid, productvariantid, rating, comment, reviewdate) VALUES ('F004', 'O004', 'PV004', 2, 'Not as expected, quality needs improvement.', '2026-05-09');
INSERT INTO public.feedback (feedbackid, orderid, productvariantid, rating, comment, reviewdate) VALUES ('F005', 'O005', 'PV005', 5, 'Amazing! Will definitely buy again.', '2026-05-12');
INSERT INTO public.feedback (feedbackid, orderid, productvariantid, rating, comment, reviewdate) VALUES ('F006', 'O006', 'PV006', 5, 'Good quality and fast delivery.', '2026-05-13');


--
-- TOC entry 4974 (class 0 OID 16792)
-- Dependencies: 223
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_product (orderproductid, orderid, productvariantid, quantity) VALUES ('OP001', 'O001', 'PV001', 1);
INSERT INTO public.order_product (orderproductid, orderid, productvariantid, quantity) VALUES ('OP002', 'O002', 'PV002', 2);
INSERT INTO public.order_product (orderproductid, orderid, productvariantid, quantity) VALUES ('OP003', 'O003', 'PV003', 1);
INSERT INTO public.order_product (orderproductid, orderid, productvariantid, quantity) VALUES ('OP004', 'O004', 'PV004', 1);
INSERT INTO public.order_product (orderproductid, orderid, productvariantid, quantity) VALUES ('OP005', 'O005', 'PV005', 1);
INSERT INTO public.order_product (orderproductid, orderid, productvariantid, quantity) VALUES ('OP006', 'O006', 'PV006', 2);
INSERT INTO public.order_product (orderproductid, orderid, productvariantid, quantity) VALUES ('OP007', 'O007', 'PV003', 1);


--
-- TOC entry 4975 (class 0 OID 16795)
-- Dependencies: 224
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orders (orderid, customerid, shoppingcartid, orderdate, ordertime, totalamount, paymentmethod, orderstatus) VALUES ('O001', 'C001', 'SC001', '2026-05-01', '14:30:00', 89.90, 'Online Banking', 'Delivered');
INSERT INTO public.orders (orderid, customerid, shoppingcartid, orderdate, ordertime, totalamount, paymentmethod, orderstatus) VALUES ('O002', 'C002', 'SC002', '2026-05-03', '10:15:00', 179.80, 'Credit Card', 'Shipped');
INSERT INTO public.orders (orderid, customerid, shoppingcartid, orderdate, ordertime, totalamount, paymentmethod, orderstatus) VALUES ('O003', 'C003', 'SC003', '2026-05-05', '09:45:00', 79.90, 'Cash', 'Pending');
INSERT INTO public.orders (orderid, customerid, shoppingcartid, orderdate, ordertime, totalamount, paymentmethod, orderstatus) VALUES ('O004', 'C004', 'SC004', '2026-05-06', '16:20:00', 129.90, 'Debit Card', 'Delivered');
INSERT INTO public.orders (orderid, customerid, shoppingcartid, orderdate, ordertime, totalamount, paymentmethod, orderstatus) VALUES ('O005', 'C005', 'SC005', '2026-05-08', '11:50:00', 59.90, 'E-Wallet', 'Out for Delivery');
INSERT INTO public.orders (orderid, customerid, shoppingcartid, orderdate, ordertime, totalamount, paymentmethod, orderstatus) VALUES ('O006', 'C001', 'SC006', '2026-05-10', '13:20:00', 79.80, 'E-Wallet', 'Delivered');
INSERT INTO public.orders (orderid, customerid, shoppingcartid, orderdate, ordertime, totalamount, paymentmethod, orderstatus) VALUES ('O007', 'C001', 'SC007', '2026-05-15', '18:10:00', 79.90, 'Online Banking', 'Processing');


--
-- TOC entry 4976 (class 0 OID 16798)
-- Dependencies: 225
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payment (paymentid, orderid, paymentdate, paymentamount) VALUES ('P001', 'O001', '2026-05-01', 89.90);
INSERT INTO public.payment (paymentid, orderid, paymentdate, paymentamount) VALUES ('P002', 'O002', '2026-05-03', 179.80);
INSERT INTO public.payment (paymentid, orderid, paymentdate, paymentamount) VALUES ('P003', 'O003', '2026-05-05', 79.90);
INSERT INTO public.payment (paymentid, orderid, paymentdate, paymentamount) VALUES ('P004', 'O004', '2026-05-06', 129.90);
INSERT INTO public.payment (paymentid, orderid, paymentdate, paymentamount) VALUES ('P005', 'O005', '2026-05-08', 59.90);
INSERT INTO public.payment (paymentid, orderid, paymentdate, paymentamount) VALUES ('P006', 'O006', '2026-05-10', 79.80);
INSERT INTO public.payment (paymentid, orderid, paymentdate, paymentamount) VALUES ('P007', 'O007', '2026-05-15', 79.90);


--
-- TOC entry 4977 (class 0 OID 16801)
-- Dependencies: 226
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product (productid, categoryid, adminid, productname, description, price) VALUES ('P001', 'CAT001', 'A001', 'Floral Dress', 'Women floral dress suitable for casual outings', 89.90);
INSERT INTO public.product (productid, categoryid, adminid, productname, description, price) VALUES ('P002', 'CAT002', 'A001', 'Blue Jeans', 'Comfortable blue denim jeans', 79.90);
INSERT INTO public.product (productid, categoryid, adminid, productname, description, price) VALUES ('P003', 'CAT003', 'A002', 'Casual Jacket', 'Lightweight casual jacket for daily wear', 129.90);
INSERT INTO public.product (productid, categoryid, adminid, productname, description, price) VALUES ('P004', 'CAT004', 'A002', 'Casual Shirt', 'Men casual shirt suitable for work', 59.90);
INSERT INTO public.product (productid, categoryid, adminid, productname, description, price) VALUES ('P005', 'CAT005', 'A001', 'Fashion Belt', 'Stylish belt suitable for casual outfits', 39.90);


--
-- TOC entry 4978 (class 0 OID 16806)
-- Dependencies: 227
-- Data for Name: product_variant; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_variant (productvariantid, productid, size, color, stockquantity) VALUES ('PV001', 'P001', 'M', 'Pink', 25);
INSERT INTO public.product_variant (productvariantid, productid, size, color, stockquantity) VALUES ('PV002', 'P001', 'S', 'White', 18);
INSERT INTO public.product_variant (productvariantid, productid, size, color, stockquantity) VALUES ('PV003', 'P002', '28', 'Blue', 30);
INSERT INTO public.product_variant (productvariantid, productid, size, color, stockquantity) VALUES ('PV004', 'P003', 'M', 'Black', 15);
INSERT INTO public.product_variant (productvariantid, productid, size, color, stockquantity) VALUES ('PV005', 'P004', 'L', 'Light Blue', 40);
INSERT INTO public.product_variant (productvariantid, productid, size, color, stockquantity) VALUES ('PV006', 'P005', 'Free Size', 'Brown', 20);


--
-- TOC entry 4979 (class 0 OID 16809)
-- Dependencies: 228
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shopping_cart (shoppingcartid, customerid, cartdate) VALUES ('SC001', 'C001', '2026-05-01');
INSERT INTO public.shopping_cart (shoppingcartid, customerid, cartdate) VALUES ('SC002', 'C002', '2026-05-02');
INSERT INTO public.shopping_cart (shoppingcartid, customerid, cartdate) VALUES ('SC003', 'C003', '2026-05-03');
INSERT INTO public.shopping_cart (shoppingcartid, customerid, cartdate) VALUES ('SC004', 'C004', '2026-05-04');
INSERT INTO public.shopping_cart (shoppingcartid, customerid, cartdate) VALUES ('SC005', 'C005', '2026-05-05');
INSERT INTO public.shopping_cart (shoppingcartid, customerid, cartdate) VALUES ('SC006', 'C001', '2026-05-10');
INSERT INTO public.shopping_cart (shoppingcartid, customerid, cartdate) VALUES ('SC007', 'C001', '2026-05-15');


--
-- TOC entry 4786 (class 2606 OID 16813)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adminid);


--
-- TOC entry 4788 (class 2606 OID 16815)
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (cartitemid);


--
-- TOC entry 4790 (class 2606 OID 16817)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categoryid);


--
-- TOC entry 4792 (class 2606 OID 16819)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customerid);


--
-- TOC entry 4794 (class 2606 OID 16821)
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (deliveryid);


--
-- TOC entry 4796 (class 2606 OID 16823)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedbackid);


--
-- TOC entry 4798 (class 2606 OID 16825)
-- Name: order_product order_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (orderproductid);


--
-- TOC entry 4800 (class 2606 OID 16827)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- TOC entry 4802 (class 2606 OID 16829)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);


--
-- TOC entry 4804 (class 2606 OID 16831)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productid);


--
-- TOC entry 4806 (class 2606 OID 16833)
-- Name: product_variant product_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT product_variant_pkey PRIMARY KEY (productvariantid);


--
-- TOC entry 4808 (class 2606 OID 16835)
-- Name: shopping_cart shopping_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_pkey PRIMARY KEY (shoppingcartid);


--
-- TOC entry 4809 (class 2606 OID 16836)
-- Name: cart_item cart_item_productvariantid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_productvariantid_fkey FOREIGN KEY (productvariantid) REFERENCES public.product_variant(productvariantid);


--
-- TOC entry 4810 (class 2606 OID 16841)
-- Name: cart_item cart_item_shoppingcartid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_shoppingcartid_fkey FOREIGN KEY (shoppingcartid) REFERENCES public.shopping_cart(shoppingcartid);


--
-- TOC entry 4811 (class 2606 OID 16846)
-- Name: delivery delivery_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid) ON DELETE CASCADE;


--
-- TOC entry 4812 (class 2606 OID 16851)
-- Name: feedback feedback_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- TOC entry 4813 (class 2606 OID 16856)
-- Name: feedback feedback_productvariantid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_productvariantid_fkey FOREIGN KEY (productvariantid) REFERENCES public.product_variant(productvariantid);


--
-- TOC entry 4814 (class 2606 OID 16861)
-- Name: order_product order_product_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid) ON DELETE CASCADE;


--
-- TOC entry 4815 (class 2606 OID 16866)
-- Name: order_product order_product_productvariantid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_productvariantid_fkey FOREIGN KEY (productvariantid) REFERENCES public.product_variant(productvariantid) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 16871)
-- Name: orders orders_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customer(customerid) ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 16876)
-- Name: orders orders_shoppingcartid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shoppingcartid_fkey FOREIGN KEY (shoppingcartid) REFERENCES public.shopping_cart(shoppingcartid) ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 16881)
-- Name: payment payment_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 16886)
-- Name: product product_adminid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid) ON DELETE SET NULL;


--
-- TOC entry 4820 (class 2606 OID 16891)
-- Name: product product_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.category(categoryid) ON DELETE SET NULL;


--
-- TOC entry 4821 (class 2606 OID 16896)
-- Name: product_variant product_variant_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT product_variant_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 16901)
-- Name: shopping_cart shopping_cart_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customer(customerid);


-- Completed on 2026-07-22 17:07:32

--
-- PostgreSQL database dump complete
--

\unrestrict UAbJNlTamHoSlggkq9FNPumajOXeLDq4zuXpdFRqtCnR2LTV88jDkwdyBumir04

