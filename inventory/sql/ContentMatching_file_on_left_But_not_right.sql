attach database "/public/software/dir-inventory-main/db/DB-23-12-06-scan1.sqlite" as d1;
attach database "/public/software/dir-inventory-main/db/DB-23-12-13-scan3.sqlite" as d2;
SELECT d1.dirs.relpn||'/'||tmp1.fname AS relpn
  FROM (SELECT d1.fsobj.pid,
               d1.fsobj.fname
          FROM d1.fsobj
          WHERE NOT d1.fsobj.csum IN (SELECT d2.fsobj.csum
                                        FROM d2.fsobj)) tmp1
  LEFT JOIN d1.dirs
    ON tmp1.pid=d1.dirs.lft;
