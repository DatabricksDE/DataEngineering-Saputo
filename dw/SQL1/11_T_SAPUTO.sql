/*************************************************************************************************
||   QUERY INFORMATION
||
||   Department:     Value Engineering
||   Programmer:     Luis Fuentes
||   Date:           08/17/2020
||   Category:       Table creation
||
||   Description:    Creates table DW.T_SAPUTO
||                   Attributes: 
||
||
||   Parameters:     None
||
||   Historic Info:
||   Name:              Date:         Brief Description:
||   ----------------------------------------------------------------------------------------------
||   Luis Fuentes       08/17/2020    Initial Creation
||   ----------------------------------------------------------------------------------------------
||
||   CURRENT REVISION STANDARD:  v1.50
||
***************************************************************************************************/

-- BEGIN
--   DW.SP_TRUNCATE('DW.T_SAPUTO');
-- END;

--DROP TABLE DW.T_SAPUTO cascade constraints;

CREATE TABLE DW.T_SAPUTO
(
    ticketid VARCHAR2(18) NOT NULL PRIMARY KEY
    ,submitter VARCHAR2(32)
    ,srid VARCHAR2(18)
    ,organization VARCHAR2(45)
    ,customer_division VARCHAR2(11)
    ,region VARCHAR2(16)
    ,site_group VARCHAR2(20)
    ,site VARCHAR2(56)
    ,customer_name VARCHAR2(42)
    ,summary VARCHAR2(120)
    ,detailed_description VARCHAR2(4000)
    ,reported_source VARCHAR2(29)
    ,service_type VARCHAR2(32)
    ,impact VARCHAR2(27)
    ,urgency VARCHAR2(12)
    ,priority VARCHAR2(10)
    ,business_service VARCHAR2(69)
    ,categorization_tier_1 VARCHAR2(18)
    ,categorization_tier_2 VARCHAR2(60)
    ,categorization_tier_3 VARCHAR2(26)
    ,product_categorization_tier_1 VARCHAR2(16)
    ,product_categorization_tier_2 VARCHAR2(41)
    ,product_categorization_tier_3 VARCHAR2(56)
    ,product_name VARCHAR2(64)
    ,support_organization VARCHAR2(26)
    ,assigned_group VARCHAR2(52)
    ,assignee VARCHAR2(41)
    ,status VARCHAR2(19)
    ,status_reason VARCHAR2(47)
    ,slm_status VARCHAR2(31)
    ,vendor_group VARCHAR2(21)
    ,vendor_ticket_number VARCHAR2(60)
    ,resolution VARCHAR2(4000)
    ,resolution_method VARCHAR2(60)
    ,resolution_category VARCHAR2(9)
    ,resolution_category_tier_2 VARCHAR2(27)
    ,resolution_category_tier_3 VARCHAR2(18)
    ,closure_product_category_tier1 VARCHAR2(16)
    ,closure_product_category_tier2 VARCHAR2(42)
    ,closure_product_category_tier3 VARCHAR2(52)
    ,closure_product_name VARCHAR2(64)
    ,submit_date DATE
    ,reported_date DATE
    ,responded_date DATE
    ,estimated_resolution_date DATE
    ,last_resolved_date DATE
    ,closed_date DATE
    ,last_modified_date DATE
    ,individual_transfers VARCHAR2(3)
    ,group_transfers VARCHAR2(3)
    ,template_name VARCHAR2(89)
    ,requested_by_organization VARCHAR2(34)
    ,requested_by_full_name VARCHAR2(41)
    ,requested_by_email VARCHAR2(58)
    ,customer_internet_email VARCHAR2(58)
    ,request_manager VARCHAR2(23)
    ,scheduled_start_date DATE
    ,scheduled_end_date DATE
    ,actual_start_date DATE
    ,actual_end_date DATE
    ,source VARCHAR(18)
    ,dw_mod_date DATE DEFAULT ON NULL SYSDATE
    ,dw_load_date DATE DEFAULT ON NULL SYSDATE
)
TABLESPACE TS_SMALL
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING
NOCOMPRESS
NOCACHE
MONITORING;

CREATE INDEX DW.T_SAPUTO_I1_submit_date ON DW.T_SAPUTO (submit_date)
  TABLESPACE TS_SMALLX
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
    INITIAL 4M
    NEXT 1M
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  );
  NOLOGGING;

CREATE INDEX DW.T_SAPUTO_I2_last_resolved_date ON DW.T_SAPUTO (last_resolved_date)
  TABLESPACE TS_SMALLX
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
    INITIAL 4M
    NEXT 1M
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  );
  NOLOGGING;

GRANT SELECT ON DW.T_SAPUTO TO SERVICE_ROLE;
GRANT ALTER, DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON DW.T_SAPUTO TO lf188653;
GRANT ALTER, DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON DW.T_SAPUTO TO TM1_ETL_ROLE;