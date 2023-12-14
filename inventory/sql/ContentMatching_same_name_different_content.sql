attach database "/public/software/dir-inventory-main/db/DB-23-12-06-scan1.sqlite" as d1;
attach database "/public/software/dir-inventory-main/db/DB-23-12-13-scan3.sqlite" as d2;

SELECT d1.annofsobj.relpn, d1.annofsobj.csum, d2.annofsobj.csum
  FROM d1.annofsobj
  INNER JOIN d2.annofsobj
      ON d1.annofsobj.fname =  d2.annofsobj.fname AND
         d1.annofsobj.csum  <> d2.annofsobj.csum  AND
         d1.annofsobj.relpn  =  d2.annofsobj.relpn;
