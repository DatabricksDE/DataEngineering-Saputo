-- Control File Name:  T_SAPUTO_STG.ctl	
--	
-- Description:	
-- SQL*Loader control file for the T_SAPUTO_STG table.
-- History
-- Luis Fuentes       08/14/2020     Initial Creation
-- pbrun dw_run.sh -A logistics -R incr -T t_saputo_stg -D YES < ~/cc/loadyes
--
options (skip=1)
LOAD DATA
CHARACTERSET UTF8
TRUNCATE
CONTINUEIF LAST != X'22'   
INTO TABLE T_SAPUTO_STG
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
  ticketid    CHAR(500) NULLIF ticketid=BLANKS    
  ,submitter   CHAR(500) NULLIF submitter=BLANKS   
  ,srid    CHAR(500) NULLIF srid=BLANKS    
  ,organization    CHAR(500) NULLIF organization=BLANKS    
  ,customer_division   CHAR(500) NULLIF customer_division=BLANKS   
  ,region  CHAR(500) NULLIF region=BLANKS  
  ,site_group  CHAR(500) NULLIF site_group=BLANKS  
  ,site   CHAR(500) NULLIF site=BLANKS    
  ,customer_name   CHAR(500) NULLIF customer_name=BLANKS   
  ,summary CHAR(500) NULLIF summary=BLANKS 
  ,detailed_description    CHAR(22000) NULLIF detailed_description=BLANKS    
  ,reported_source CHAR(500) NULLIF reported_source=BLANKS 
  ,service_type    CHAR(500) NULLIF service_type=BLANKS    
  ,impact  CHAR(500) NULLIF impact=BLANKS  
  ,urgency CHAR(500) NULLIF urgency=BLANKS 
  ,priority    CHAR(500) NULLIF priority=BLANKS    
  ,business_service    CHAR(500) NULLIF business_service=BLANKS    
  ,categorization_tier_1   CHAR(500) NULLIF categorization_tier_1=BLANKS   
  ,categorization_tier_2   CHAR(500) NULLIF categorization_tier_2=BLANKS   
  ,categorization_tier_3   CHAR(500) NULLIF categorization_tier_3=BLANKS   
  ,product_categorization_tier_1   CHAR(500) NULLIF product_categorization_tier_1=BLANKS   
  ,product_categorization_tier_2   CHAR(500) NULLIF product_categorization_tier_2=BLANKS   
  ,product_categorization_tier_3   CHAR(500) NULLIF product_categorization_tier_3=BLANKS   
  ,product_name    CHAR(500) NULLIF product_name=BLANKS    
  ,support_organization    CHAR(500) NULLIF support_organization=BLANKS    
  ,assigned_group  CHAR(500) NULLIF assigned_group=BLANKS  
  ,assignee    CHAR(500) NULLIF assignee=BLANKS    
  ,status CHAR(500) NULLIF status=BLANKS  
  ,status_reason   CHAR(500) NULLIF status_reason=BLANKS   
  ,slm_status  CHAR(500) NULLIF slm_status=BLANKS  
  ,vendor_group    CHAR(500) NULLIF vendor_group=BLANKS    
  ,vendor_ticket_number    CHAR(500) NULLIF vendor_ticket_number=BLANKS    
  ,resolution  CHAR(22000) NULLIF resolution=BLANKS  
  ,resolution_method   CHAR(500) NULLIF resolution_method=BLANKS   
  ,resolution_category CHAR(500) NULLIF resolution_category=BLANKS 
  ,resolution_category_tier_2  CHAR(500) NULLIF resolution_category_tier_2=BLANKS  
  ,resolution_category_tier_3  CHAR(500) NULLIF resolution_category_tier_3=BLANKS  
  ,closure_product_category_tier1  CHAR(500) NULLIF closure_product_category_tier1=BLANKS  
  ,closure_product_category_tier2  CHAR(500) NULLIF closure_product_category_tier2=BLANKS  
  ,closure_product_category_tier3  CHAR(500) NULLIF closure_product_category_tier3=BLANKS  
  ,closure_product_name    CHAR(500) NULLIF closure_product_name=BLANKS    
  ,submit_date CHAR(500) NULLIF submit_date=BLANKS 
  ,reported_date   CHAR(500) NULLIF reported_date=BLANKS   
  ,responded_date  CHAR(500) NULLIF responded_date=BLANKS  
  ,estimated_resolution_date   CHAR(500) NULLIF estimated_resolution_date=BLANKS   
  ,last_resolved_date  CHAR(500) NULLIF last_resolved_date=BLANKS  
  ,closed_date CHAR(500) NULLIF closed_date=BLANKS 
  ,last_modified_date  CHAR(500) NULLIF last_modified_date=BLANKS  
  ,individual_transfers    CHAR(500) NULLIF individual_transfers=BLANKS    
  ,group_transfers CHAR(500) NULLIF group_transfers=BLANKS 
  ,template_name   CHAR(500) NULLIF template_name=BLANKS   
  ,requested_by_organization   CHAR(500) NULLIF requested_by_organization=BLANKS   
  ,requested_by_full_name  CHAR(500) NULLIF requested_by_full_name=BLANKS  
  ,requested_by_email  CHAR(500) NULLIF requested_by_email=BLANKS  
  ,customer_internet_email CHAR(500) NULLIF customer_internet_email=BLANKS 
  ,request_manager CHAR(500) NULLIF request_manager=BLANKS 
  ,scheduled_start_date    CHAR(500) NULLIF scheduled_start_date=BLANKS    
  ,scheduled_end_date  CHAR(500) NULLIF scheduled_end_date=BLANKS  
  ,actual_start_date   CHAR(500) NULLIF actual_start_date=BLANKS   
  ,actual_end_date CHAR(500) NULLIF actual_end_date=BLANKS 
  ,dw_mod_date "SYSDATE"
  ,dw_load_date "SYSDATE" 
)
