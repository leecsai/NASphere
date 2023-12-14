attach database "/public/software/dir-inventory-main/db/DB-23-12-06-scan1.sqlite" as d1;
attach database "/public/software/dir-inventory-main/db/DB-23-12-13-scan3.sqlite" as d2;
SELECT d1.annofsobj.relpn
  FROM d1.annofsobj
  WHERE NOT d1.annofsobj.relpn IN (SELECT d2.annofsobj.relpn
                                     FROM d2.annofsobj);
