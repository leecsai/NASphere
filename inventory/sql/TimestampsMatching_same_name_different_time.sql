attach database "/public/software/dir-inventory-main/db/DB-23-12-06-scan1.sqlite" as d1;
attach database "/public/software/dir-inventory-main/db/DB-23-12-13-scan3.sqlite" as d2;

SELECT d1.annofsobj.relpn, d1.annofsobj.mtime, d2.annofsobj.mtime, d1.annofsobj.ctime, d2.annofsobj.ctime
  FROM d1.annofsobj
  INNER JOIN d2.annofsobj
      ON d1.annofsobj.fname =  d2.annofsobj.fname       AND
         (d1.annofsobj.mtime <> d2.annofsobj.mtime      OR
          d1.annofsobj.ctime <> d2.annofsobj.ctime)     AND
         d1.annofsobj.relpn  =  d2.annofsobj.relpn; 
