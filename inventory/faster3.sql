###create the new views from existing views.
CREATE TABLE materialized_dirs AS SELECT * FROM dirs;
CREATE TABLE materialized_annofsobj AS SELECT * FROM annofsobj;
CREATE TABLE materialized_annofsobjfq AS SELECT * FROM annofsobjfq;

###delete the old views and rename the new views
drop VIEW annofsobjfq;
ALTER TABLE materialized_annofsobjfq RENAME TO annofsobjfq;

drop VIEW annofsobj;
ALTER TABLE materialized_annofsobj RENAME TO annofsobj;

DROP VIEW dirs;
ALTER TABLE materialized_dirs RENAME TO dirs;

###add the new index
CREATE UNIQUE INDEX dirs_relpn   ON dirs (relpn);
CREATE UNIQUE INDEX dirs_id     ON dirs (id);
CREATE UNIQUE INDEX dirs_lft    ON dirs (lft);
CREATE UNIQUE INDEX dirs_rgt    ON dirs (rgt);
CREATE        INDEX dirs_pid    ON dirs (pid);
CREATE        INDEX dirs_ddeep  ON dirs (ddeep);

CREATE UNIQUE INDEX annofsobj_id    ON annofsobj (id);
CREATE        INDEX annofsobj_pid   ON annofsobj (pid);
CREATE UNIQUE INDEX annofsobj_lft   ON annofsobj (lft);
CREATE UNIQUE INDEX annofsobj_rgt   ON annofsobj (rgt);
CREATE        INDEX annofsobj_ddeep ON annofsobj (ddeep);
CREATE        INDEX annofsobj_fname ON annofsobj (fname);
CREATE        INDEX annofsobj_ftype ON annofsobj (ftype);


