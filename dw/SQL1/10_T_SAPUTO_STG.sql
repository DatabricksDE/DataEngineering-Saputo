/*************************************************************************************************
||   QUERY INFORMATION
||
||   Department:     Value Engineering
||   Programmer:     Luis Fuentes
||   Date:           08/14/2020
||   Category:       Table creation
||
||   Description:    Creates table DW.T_SAPUTO_STG
||                   Attributes: 
||
||
||   Parameters:     None
||
||   Historic Info:
||   Name:              Date:         Brief Description:
||   ----------------------------------------------------------------------------------------------
||   Luis Fuentes       08/14/2020    Initial Creation
||   Luis Fuentes       08/17/2020    Data to clob https://oracle-base.com/articles/10g/load-lob-data-using-sql-loader
||   ----------------------------------------------------------------------------------------------
||
||   CURRENT REVISION STANDARD:  v1.50
||
***************************************************************************************************/

-- BEGIN
--   DW.SP_TRUNCATE('DW.T_SAPUTO_STG');
-- END;

--DROP TABLE DW.T_SAPUTO_STG cascade constraints;

CREATE TABLE DW.T_SAPUTO_STG
(
    ticketid    VARCHAR2(500)
    ,submitter   VARCHAR2(500)
    ,srid    VARCHAR2(500)
    ,organization    VARCHAR2(500)
    ,customer_division   VARCHAR2(500)
    ,region  VARCHAR2(500)
    ,site_group  VARCHAR2(500)
    ,site    VARCHAR2(500)
    ,customer_name   VARCHAR2(500)
    ,summary VARCHAR2(500)
    ,detailed_description    CLOB
    ,reported_source VARCHAR2(500)
    ,service_type    VARCHAR2(500)
    ,impact  VARCHAR2(500)
    ,urgency VARCHAR2(500)
    ,priority    VARCHAR2(500)
    ,business_service    VARCHAR2(500)
    ,categorization_tier_1   VARCHAR2(500)
    ,categorization_tier_2   VARCHAR2(500)
    ,categorization_tier_3   VARCHAR2(500)
    ,product_categorization_tier_1   VARCHAR2(500)
    ,product_categorization_tier_2   VARCHAR2(500)
    ,product_categorization_tier_3   VARCHAR2(500)
    ,product_name    VARCHAR2(500)
    ,support_organization    VARCHAR2(500)
    ,assigned_group  VARCHAR2(500)
    ,assignee    VARCHAR2(500)
    ,status  VARCHAR2(500)
    ,status_reason   VARCHAR2(500)
    ,slm_status  VARCHAR2(500)
    ,vendor_group    VARCHAR2(500)
    ,vendor_ticket_number    VARCHAR2(500)
    ,resolution  CLOB
    ,resolution_method   VARCHAR2(500)
    ,resolution_category VARCHAR2(500)
    ,resolution_category_tier_2  VARCHAR2(500)
    ,resolution_category_tier_3  VARCHAR2(500)
    ,closure_product_category_tier1  VARCHAR2(500)
    ,closure_product_category_tier2  VARCHAR2(500)
    ,closure_product_category_tier3  VARCHAR2(500)
    ,closure_product_name    VARCHAR2(500)
    ,submit_date VARCHAR2(500)
    ,reported_date   VARCHAR2(500)
    ,responded_date  VARCHAR2(500)
    ,estimated_resolution_date   VARCHAR2(500)
    ,last_resolved_date  VARCHAR2(500)
    ,closed_date VARCHAR2(500)
    ,last_modified_date  VARCHAR2(500)
    ,individual_transfers    VARCHAR2(500)
    ,group_transfers VARCHAR2(500)
    ,template_name   VARCHAR2(500)
    ,requested_by_organization   VARCHAR2(500)
    ,requested_by_full_name  VARCHAR2(500)
    ,requested_by_email  VARCHAR2(500)
    ,customer_internet_email VARCHAR2(500)
    ,request_manager VARCHAR2(500)
    ,scheduled_start_date    VARCHAR2(500)
    ,scheduled_end_date  VARCHAR2(500)
    ,actual_start_date   VARCHAR2(500)
    ,actual_end_date VARCHAR2(500)              
    ,dw_mod_date    DATE DEFAULT ON NULL SYSDATE
    ,dw_load_date   DATE DEFAULT ON NULL SYSDATE
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

--GRANT SELECT ON DW.T_SAPUTO_STG TO SERVICE_ROLE;
GRANT ALTER, DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON DW.T_SAPUTO_STG TO lf188653;
GRANT ALTER, DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON DW.T_SAPUTO_STG TO TM1_ETL_ROLE;