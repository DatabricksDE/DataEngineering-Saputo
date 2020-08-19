CREATE OR REPLACE PROCEDURE DW.SPW_T_SAPUTO (iCommit IN NUMBER DEFAULT 2000
) is
/***********************************************************************************
||   QUERY INFORMATION
||
||   Department:     Value Engineering
||   Programmer:     Luis Fuentes
||   Date:           08/17/2020
||   Category:       Table
||
||   Description:    Loads table T_SAPUTO
||
||   Parameters:     None
||
||   Historic Info:
||   Name:           Date:        Brief Description:
||   -----------------------------------------------------------------------------
||   Luis Fuentes     08/17/2020   Initial Creation
||   -----------------------------------------------------------------------------
||
||   CURRENT REVISION STANDARD:  v1.50
||
***********************************************************************************/
/*******************************************************************************************
*  Generated using sp_gen_bulk() jg 2006
*******************************************************************************************/

-- Data to INSERT INTO T_SAPUTO
CURSOR c IS
SELECT TRIM(ticketid) AS ticketid
      ,TRIM(submitter) AS submitter
      ,TRIM(srid) AS srid
      ,TRIM(organization) AS organization
      ,TRIM(customer_division) AS customer_division
      ,TRIM(region) AS region
      ,TRIM(site_group) AS site_group
      ,TRIM(site) AS site
      ,TRIM(customer_name) AS customer_name
      ,TRIM(summary) AS summary
      ,CAST(TO_CHAR(detailed_description) AS VARCHAR2(4000)) AS detailed_description
      ,TRIM(reported_source) AS reported_source
      ,TRIM(service_type) AS service_type
      ,TRIM(impact) AS impact
      ,TRIM(urgency) AS urgency
      ,TRIM(priority) AS priority
      ,TRIM(business_service) AS business_service
      ,TRIM(categorization_tier_1) AS categorization_tier_1
      ,TRIM(categorization_tier_2) AS categorization_tier_2
      ,TRIM(categorization_tier_3) AS categorization_tier_3
      ,TRIM(product_categorization_tier_1) AS product_categorization_tier_1
      ,TRIM(product_categorization_tier_2) AS product_categorization_tier_2
      ,TRIM(product_categorization_tier_3) AS product_categorization_tier_3
      ,TRIM(product_name) AS product_name
      ,TRIM(support_organization) AS support_organization
      ,TRIM(assigned_group) AS assigned_group
      ,TRIM(assignee) AS assignee
      ,TRIM(status) AS status
      ,TRIM(status_reason) AS status_reason
      ,TRIM(slm_status) AS slm_status
      ,TRIM(vendor_group) AS vendor_group
      ,TRIM(vendor_ticket_number) AS vendor_ticket_number
      ,CAST(TO_CHAR(resolution) AS VARCHAR2(4000)) AS resolution
      ,TRIM(resolution_method) AS resolution_method
      ,TRIM(resolution_category) AS resolution_category
      ,TRIM(resolution_category_tier_2) AS resolution_category_tier_2
      ,TRIM(resolution_category_tier_3) AS resolution_category_tier_3
      ,TRIM(closure_product_category_tier1) AS closure_product_category_tier1
      ,TRIM(closure_product_category_tier2) AS closure_product_category_tier2
      ,TRIM(closure_product_category_tier3) AS closure_product_category_tier3
      ,TRIM(closure_product_name) AS closure_product_name
      ,TO_DATE(TRIM(submit_date), 'YYYY-MM-DD HH24:MI:SS') AS submit_date    
      ,TO_DATE(TRIM(reported_date), 'YYYY-MM-DD HH24:MI:SS') AS reported_date  
      ,TO_DATE(TRIM(responded_date), 'YYYY-MM-DD HH24:MI:SS') AS responded_date 
      ,TO_DATE(TRIM(estimated_resolution_date), 'YYYY-MM-DD HH24:MI:SS') AS estimated_resolution_date  
      ,TO_DATE(TRIM(last_resolved_date), 'YYYY-MM-DD HH24:MI:SS') AS last_resolved_date 
      ,TO_DATE(TRIM(closed_date), 'YYYY-MM-DD HH24:MI:SS') AS closed_date    
      ,TO_DATE(TRIM(last_modified_date), 'YYYY-MM-DD HH24:MI:SS') AS last_modified_date 
      ,TRIM(individual_transfers) AS individual_transfers
      ,TRIM(group_transfers) AS group_transfers
      ,TRIM(template_name) AS template_name
      ,TRIM(requested_by_organization) AS requested_by_organization
      ,TRIM(requested_by_full_name) AS requested_by_full_name
      ,TRIM(requested_by_email) AS requested_by_email
      ,TRIM(customer_internet_email) AS customer_internet_email
      ,TRIM(request_manager) AS request_manager
      ,TO_DATE(TRIM(scheduled_start_date),'YYYY-MM-DD HH24:MI:SS') AS scheduled_start_date
      ,TO_DATE(TRIM(scheduled_end_date),'YYYY-MM-DD HH24:MI:SS') AS scheduled_end_date
      ,TO_DATE(TRIM(actual_start_date),'YYYY-MM-DD HH24:MI:SS') AS actual_start_date
      ,TO_DATE(TRIM(actual_end_date),'YYYY-MM-DD HH24:MI:SS') AS actual_end_date
      ,CASE WHEN SUBSTR(UPPER(ticketid), 1,2) = 'WO' THEN 'WorkOrders' ELSE 'Incidents' END AS SOURCE
      ,dw_mod_date
      ,dw_load_date
FROM DW.T_SAPUTO_STG
;

--Standard Variables
dNow              Date := Sysdate;
iTotalRows        Integer := 0;
iTotalErrors      Integer := 0;
iLoadSequence     Integer := 999999;
iLoadInstanceSeq  Integer;
iExceptionCode    Integer;
vExceptionMessage Varchar2(256);
------------------------------------------------------
-- END DECLARATIONS
------------------------------------------------------

------------------------------------------------------
-- BEGIN MAIN
------------------------------------------------------

--BULK COLLECT VARIABLES c CURSOR
ticketid_t DBMS_SQL.VARCHAR2_TABLE;
submitter_t DBMS_SQL.VARCHAR2_TABLE;
srid_t DBMS_SQL.VARCHAR2_TABLE;
organization_t DBMS_SQL.VARCHAR2_TABLE;
customer_division_t DBMS_SQL.VARCHAR2_TABLE;
region_t DBMS_SQL.VARCHAR2_TABLE;
site_group_t DBMS_SQL.VARCHAR2_TABLE;
site_t DBMS_SQL.VARCHAR2_TABLE;
customer_name_t DBMS_SQL.VARCHAR2_TABLE;
summary_t DBMS_SQL.VARCHAR2_TABLE;
detailed_description_t DBMS_SQL.VARCHAR2_TABLE;
reported_source_t DBMS_SQL.VARCHAR2_TABLE;
service_type_t DBMS_SQL.VARCHAR2_TABLE;
impact_t DBMS_SQL.VARCHAR2_TABLE;
urgency_t DBMS_SQL.VARCHAR2_TABLE;
priority_t DBMS_SQL.VARCHAR2_TABLE;
business_service_t DBMS_SQL.VARCHAR2_TABLE;
categorization_tier_1_t DBMS_SQL.VARCHAR2_TABLE;
categorization_tier_2_t DBMS_SQL.VARCHAR2_TABLE;
categorization_tier_3_t DBMS_SQL.VARCHAR2_TABLE;
pc_tier_1_t DBMS_SQL.VARCHAR2_TABLE;
pc_tier_2_t DBMS_SQL.VARCHAR2_TABLE;
pc_tier_3_t DBMS_SQL.VARCHAR2_TABLE;
product_name_t DBMS_SQL.VARCHAR2_TABLE;
support_organization_t DBMS_SQL.VARCHAR2_TABLE;
assigned_group_t DBMS_SQL.VARCHAR2_TABLE;
assignee_t DBMS_SQL.VARCHAR2_TABLE;
status_t DBMS_SQL.VARCHAR2_TABLE;
status_reason_t DBMS_SQL.VARCHAR2_TABLE;
slm_status_t DBMS_SQL.VARCHAR2_TABLE;
vendor_group_t DBMS_SQL.VARCHAR2_TABLE;
vendor_ticket_number_t DBMS_SQL.VARCHAR2_TABLE;
resolution_t DBMS_SQL.VARCHAR2_TABLE;
resolution_method_t DBMS_SQL.VARCHAR2_TABLE;
resolution_category_t DBMS_SQL.VARCHAR2_TABLE;
resolution_category_tier_2_t DBMS_SQL.VARCHAR2_TABLE;
resolution_category_tier_3_t DBMS_SQL.VARCHAR2_TABLE;
cpc_tier1_t DBMS_SQL.VARCHAR2_TABLE;
cpc_tier2_t DBMS_SQL.VARCHAR2_TABLE;
cpc_tier3_t DBMS_SQL.VARCHAR2_TABLE;
closure_product_name_t DBMS_SQL.VARCHAR2_TABLE;
submit_date_t DBMS_SQL.DATE_TABLE;
reported_date_t DBMS_SQL.DATE_TABLE;
responded_date_t DBMS_SQL.DATE_TABLE;
estimated_resolution_date_t DBMS_SQL.DATE_TABLE;
last_resolved_date_t DBMS_SQL.DATE_TABLE;
closed_date_t DBMS_SQL.DATE_TABLE;
last_modified_date_t DBMS_SQL.DATE_TABLE;
individual_transfers_t DBMS_SQL.VARCHAR2_TABLE;
group_transfers_t DBMS_SQL.VARCHAR2_TABLE;
template_name_t DBMS_SQL.VARCHAR2_TABLE;
requested_by_organization_t DBMS_SQL.VARCHAR2_TABLE;
requested_by_full_name_t DBMS_SQL.VARCHAR2_TABLE;
requested_by_email_t DBMS_SQL.VARCHAR2_TABLE;
customer_internet_email_t DBMS_SQL.VARCHAR2_TABLE;
request_manager_t DBMS_SQL.VARCHAR2_TABLE;
scheduled_start_date_t DBMS_SQL.DATE_TABLE;
scheduled_end_date_t DBMS_SQL.DATE_TABLE;
actual_start_date_t DBMS_SQL.DATE_TABLE;
actual_end_date_t DBMS_SQL.DATE_TABLE;
source_t DBMS_SQL.VARCHAR2_TABLE;
dw_mod_date_t DBMS_SQL.DATE_TABLE;
dw_load_date_t DBMS_SQL.DATE_TABLE;

BEGIN --B1

-- Conditional Create of New Seq Number
dw.sp_md_get_next_seq('T_SAPUTO',
     'T_SAPUTO',
     'OBJID',
     1, --- ACTIVE CODE 1 OR 0 PRETTY MUCH ALWAYS ACTIVE '
     'T_SAPUTO',
     'ORACLE DB-LINK',
     'DW TABLE LOAD',
     'T_SAPUTO',
     iLoadSequence,
     'DW');

dw.pkg_load_verify.p_begin_load(iloadsequence,iloadinstanceseq);

-----------------------------------------------------------------
--Calculate and load new data
-----------------------------------------------------------------
OPEN c;
LOOP
     FETCH c BULK COLLECT INTO
        ticketid_t,
        submitter_t,
        srid_t,
        organization_t,
        customer_division_t,
        region_t,
        site_group_t,
        site_t,
        customer_name_t,
        summary_t,
        detailed_description_t,
        reported_source_t,
        service_type_t,
        impact_t,
        urgency_t,
        priority_t,
        business_service_t,
        categorization_tier_1_t,
        categorization_tier_2_t,
        categorization_tier_3_t,
        pc_tier_1_t,
        pc_tier_2_t,
        pc_tier_3_t,
        product_name_t,
        support_organization_t,
        assigned_group_t,
        assignee_t,
        status_t,
        status_reason_t,
        slm_status_t,
        vendor_group_t,
        vendor_ticket_number_t,
        resolution_t,
        resolution_method_t,
        resolution_category_t,
        resolution_category_tier_2_t,
        resolution_category_tier_3_t,
        cpc_tier1_t,
        cpc_tier2_t,
        cpc_tier3_t,
        closure_product_name_t,
        submit_date_t,
        reported_date_t,
        responded_date_t,
        estimated_resolution_date_t,
        last_resolved_date_t,
        closed_date_t,
        last_modified_date_t,
        individual_transfers_t,
        group_transfers_t,
        template_name_t,
        requested_by_organization_t,
        requested_by_full_name_t,
        requested_by_email_t,
        customer_internet_email_t,
        request_manager_t,
        scheduled_start_date_t,
        scheduled_end_date_t,
        actual_start_date_t,
        actual_end_date_t,
        source_t,
        dw_mod_date_t,
        dw_load_date_t
     LIMIT iCommit;
     FOR i in 1 .. ticketid_t.COUNT
    LOOP
        BEGIN --B2 insert
        INSERT INTO DW.T_SAPUTO (
            ticketid,
            submitter,
            srid,
            organization,
            customer_division,
            region,
            site_group,
            site,
            customer_name,
            summary,
            detailed_description,
            reported_source,
            service_type,
            impact,
            urgency,
            priority,
            business_service,
            categorization_tier_1,
            categorization_tier_2,
            categorization_tier_3,
            product_categorization_tier_1,
            product_categorization_tier_2,
            product_categorization_tier_3,
            product_name,
            support_organization,
            assigned_group,
            assignee,
            status,
            status_reason,
            slm_status,
            vendor_group,
            vendor_ticket_number,
            resolution,
            resolution_method,
            resolution_category,
            resolution_category_tier_2,
            resolution_category_tier_3,
            closure_product_category_tier1,
            closure_product_category_tier2,
            closure_product_category_tier3,
            closure_product_name,
            submit_date,
            reported_date,
            responded_date,
            estimated_resolution_date,
            last_resolved_date,
            closed_date,
            last_modified_date,
            individual_transfers,
            group_transfers,
            template_name,
            requested_by_organization,
            requested_by_full_name,
            requested_by_email,
            customer_internet_email,
            request_manager,
            scheduled_start_date,
            scheduled_end_date,
            actual_start_date,
            actual_end_date,
            source,
            dw_mod_date,
            dw_load_date
        )
        VALUES (
            ticketid_t(i),
            submitter_t(i),
            srid_t(i),
            organization_t(i),
            customer_division_t(i),
            region_t(i),
            site_group_t(i),
            site_t(i),
            customer_name_t(i),
            summary_t(i),
            detailed_description_t(i),
            reported_source_t(i),
            service_type_t(i),
            impact_t(i),
            urgency_t(i),
            priority_t(i),
            business_service_t(i),
            categorization_tier_1_t(i),
            categorization_tier_2_t(i),
            categorization_tier_3_t(i),
            pc_tier_1_t(i),
            pc_tier_2_t(i),
            pc_tier_3_t(i),
            product_name_t(i),
            support_organization_t(i),
            assigned_group_t(i),
            assignee_t(i),
            status_t(i),
            status_reason_t(i),
            slm_status_t(i),
            vendor_group_t(i),
            vendor_ticket_number_t(i),
            resolution_t(i),
            resolution_method_t(i),
            resolution_category_t(i),
            resolution_category_tier_2_t(i),
            resolution_category_tier_3_t(i),
            cpc_tier1_t(i),
            cpc_tier2_t(i),
            cpc_tier3_t(i),
            closure_product_name_t(i),
            submit_date_t(i),
            reported_date_t(i),
            responded_date_t(i),
            estimated_resolution_date_t(i),
            last_resolved_date_t(i),
            closed_date_t(i),
            last_modified_date_t(i),
            individual_transfers_t(i),
            group_transfers_t(i),
            template_name_t(i),
            requested_by_organization_t(i),
            requested_by_full_name_t(i),
            requested_by_email_t(i),
            customer_internet_email_t(i),
            request_manager_t(i),
            scheduled_start_date_t(i),
            scheduled_end_date_t(i),
            actual_start_date_t(i),
            actual_end_date_t(i),
            source_t(i),
            dw_mod_date_t(i),
            dw_load_date_t(i)
        );
        EXCEPTION -- B2
        WHEN dup_val_on_index THEN
        BEGIN--B3
        UPDATE DW.T_SAPUTO
            SET submitter = submitter_t(i),
                srid = srid_t(i),
                organization = organization_t(i),
                customer_division = customer_division_t(i),
                region = region_t(i),
                site_group = site_group_t(i),
                site = site_t(i),
                customer_name = customer_name_t(i),
                summary = summary_t(i),
                detailed_description = detailed_description_t(i),
                reported_source = reported_source_t(i),
                service_type = service_type_t(i),
                impact = impact_t(i),
                urgency = urgency_t(i),
                priority = priority_t(i),
                business_service = business_service_t(i),
                categorization_tier_1 = categorization_tier_1_t(i),
                categorization_tier_2 = categorization_tier_2_t(i),
                categorization_tier_3 = categorization_tier_3_t(i),
                product_categorization_tier_1 = pc_tier_1_t(i),
                product_categorization_tier_2 = pc_tier_2_t(i),
                product_categorization_tier_3 = pc_tier_3_t(i),
                product_name = product_name_t(i),
                support_organization = support_organization_t(i),
                assigned_group = assigned_group_t(i),
                assignee = assignee_t(i),
                status = status_t(i),
                status_reason = status_reason_t(i),
                slm_status = slm_status_t(i),
                vendor_group = vendor_group_t(i),
                vendor_ticket_number = vendor_ticket_number_t(i),
                resolution = resolution_t(i),
                resolution_method = resolution_method_t(i),
                resolution_category = resolution_category_t(i),
                resolution_category_tier_2 = resolution_category_tier_2_t(i),
                resolution_category_tier_3 = resolution_category_tier_3_t(i),
                closure_product_category_tier1 = cpc_tier1_t(i),
                closure_product_category_tier2 = cpc_tier2_t(i),
                closure_product_category_tier3 = cpc_tier3_t(i),
                closure_product_name = closure_product_name_t(i),
                submit_date = submit_date_t(i),
                reported_date = reported_date_t(i),
                responded_date = responded_date_t(i),
                estimated_resolution_date = estimated_resolution_date_t(i),
                last_resolved_date = last_resolved_date_t(i),
                closed_date = closed_date_t(i),
                last_modified_date = last_modified_date_t(i),
                individual_transfers = individual_transfers_t(i),
                group_transfers = group_transfers_t(i),
                template_name = template_name_t(i),
                requested_by_organization = requested_by_organization_t(i),
                requested_by_full_name = requested_by_full_name_t(i),
                requested_by_email = requested_by_email_t(i),
                customer_internet_email = customer_internet_email_t(i),
                request_manager = request_manager_t(i),
                scheduled_start_date = scheduled_start_date_t(i),
                scheduled_end_date = scheduled_end_date_t(i),
                actual_start_date = actual_start_date_t(i),
                actual_end_date = actual_end_date_t(i),
                source = source_t(i),
                dw_mod_date = SYSDATE,
                dw_load_date = SYSDATE
        WHERE ticketid = ticketid_t(i)
        ;
--HADLE OTHER ERRORS
EXCEPTION --B2
     WHEN OTHERS THEN
     --INSERT ERROR INFORMATION
          BEGIN --B4
          itotalerrors := itotalerrors + 1;
          dw.pkg_load_verify.p_record_exception(iloadinstanceseq
          ,substr('DW.T_SAPUTO err:'||sqlerrm,1,256)
          ,SQLCODE
          ,SQLERRM
          ,'');
          END; --B4
     END; --B3 dup_val_on_index block
     END; --B2 insert exception block
     END LOOP;
     -- ASSIGN HOW MANY RECORDS PROCESSED
     itotalrows := c%ROWCOUNT;
     -- CONDITIONAL/INCREMENTAL TRANSACTION COMMIT
          dw.pkg_load_verify.p_commit_load(iloadinstanceseq
          ,itotalrows - itotalerrors
          ,itotalerrors);
     EXIT WHEN c%NOTFOUND;
END LOOP;
CLOSE c;
COMMIT;

-- FINAL COMMIT AND MD UPDATE
 dw.pkg_load_verify.p_commit_load(iloadinstanceseq
      ,itotalrows - itotalerrors
      ,itotalerrors);
 -- END LOAD AND UPDATE MD INFO
 dw.pkg_load_verify.p_end_load(iloadinstanceseq
      ,itotalrows - itotalerrors
      ,itotalerrors);
 EXCEPTION
 WHEN OTHERS THEN
 --GENERAL ERROR INFORMATION
BEGIN --B4
itotalerrors := itotalerrors + 1;
dw.pkg_load_verify.p_record_exception(iloadinstanceseq
,substr('DW.T_SAPUTO GENERAL err:'||sqlerrm,1,256)
,SQLCODE
,SQLERRM
,'');
END; --B4
     ------------------------------------------------------
     -- END MAIN
     ------------------------------------------------------
END; --B1
/

GRANT EXECUTE ON DW.SPW_T_SAPUTO TO TM1_ETL_ROLE;
GRANT EXECUTE ON DW.SPW_T_SAPUTO TO LF188653;