attach database "/public/software/dir-inventory-main/db/DB-23-12-06-scan1.sqlite" as d1;
attach database "/public/software/dir-inventory-main/db/DB-23-12-13-scan3.sqlite" as d2;
SELECT d2.dirs.relpn||'/'||tmp1.fname AS relpn
  FROM (SELECT d2.fsobj.pid,
               d2.fsobj.fname
          FROM d2.fsobj
          WHERE NOT d2.fsobj.csum IN (SELECT d1.fsobj.csum
                                        FROM d1.fsobj)) tmp1
  LEFT JOIN d2.dirs
    ON tmp1.pid=d2.dirs.id;
