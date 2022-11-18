CREATE INDEX "${schema}"."CARRELLO_RPT_IDX03" ON "${schema}"."CARRELLO_RPT" ("CODICE_CARRELLO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "${tablespaceIdx}"  LOCAL
PARALLEL 1 ;

  ALTER INDEX "${schema}"."CARRELLO_RPT_IDX03" NOPARALLEL;
CREATE INDEX "${schema}"."CARRELLO_RPT_IDX01" ON "${schema}"."CARRELLO_RPT" ("ID_SESSIONE")
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "${tablespaceIdx}"  LOCAL
PARALLEL 1 ;

  ALTER INDEX "${schema}"."CARRELLO_RPT_IDX01" NOPARALLEL;
CREATE INDEX "${schema}"."CARRELLO_RPT_IDX04" ON "${schema}"."CARRELLO_RPT" ("ID_CARRELLO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "${tablespaceIdx}"  LOCAL
 PARALLEL 1 ;

  ALTER INDEX "${schema}"."CARRELLO_RPT_IDX04" NOPARALLEL;
CREATE INDEX "${schema}"."CARRELLO_RPT_IDX02" ON "${schema}"."CARRELLO_RPT" ("PARAMETRI_PAGAMENTO_IMMEDIATO", "PSP")
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "${tablespaceIdx}"  LOCAL
 PARALLEL 1 ;

  ALTER INDEX "${schema}"."CARRELLO_RPT_IDX02" NOPARALLEL;
CREATE UNIQUE INDEX "${schema}"."NODO_ONLINE_CARRELLO_IDX1" ON "${schema}"."CARRELLO_RPT" ("PARAMETRI_PAGAMENTO_IMMEDIATO", "PSP", "CODICE_CARRELLO")
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "${tablespaceIdx}" PARALLEL 1 ;

  ALTER INDEX "${schema}"."NODO_ONLINE_CARRELLO_IDX1" NOPARALLEL;
CREATE INDEX "${schema}"."RPT_IDX01" ON "${schema}"."RPT" ("ID_SESSIONE")
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "${tablespaceIdx}"  LOCAL
 PARALLEL 1 ;

  ALTER INDEX "${schema}"."RPT_IDX01" NOPARALLEL;
CREATE INDEX "${schema}"."RPT_IDX02" ON "${schema}"."RPT" ("PARAMETRI_PAGAMENTO_IMMEDIATO", "PSP")
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "${tablespaceIdx}"  LOCAL
PARALLEL 1 ;

  ALTER INDEX "${schema}"."RPT_IDX02" NOPARALLEL;
CREATE INDEX "${schema}"."RPT_IDX03" ON "${schema}"."RPT" ("IUV", "CCP")
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "${tablespaceIdx}"  LOCAL
 PARALLEL 1 ;

  ALTER INDEX "${schema}"."RPT_IDX03" NOPARALLEL;