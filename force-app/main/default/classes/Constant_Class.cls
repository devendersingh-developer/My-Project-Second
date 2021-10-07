/**
* @File Name          : Constant_Class.apxc
* @Description        : THis class is used to store all the hardcode constant vairables
* @Author             : Karan Singh Soni
* @Created On         : 23 April 2021
*==============================================================================
* Ver         Date                     Author      		      Modification
*==============================================================================
* 1.0    23/04/2021      Karan Singh    			  Initial Version
**/
public without sharing class Constant_Class {
    
    //__________________________________________________  Constant Variables  __________________________________________
    
    public static final String KARZA_API_ALTERNATE_EMAILID = '';
    public static final String BANK_STATEMENT_PREFIX = 'Bank statement';
    public static final String BANK_SALARY_ACCOUNT_SUFFIX = 'Bank statement (Salary Account)';
    public static final String LEGAL_DOCUMENT_SUFFIX = '_Legal__';
    public static final String COMMON_DOCUMENT_SUFFIX = '_Common__';
    public static final String LEGAL_VENDOR_SIGNATURE_SUFFIX = '___Legal Vendor Signature';
    public static final Set<String> CIBIL_API_DPD_VALUES_TO_IGNORE = new Set<String>{
        'STD','XXX','000'};
    public static final Integer CIBIL_NORMS_LOW_CIBIL_SCORE_VALUE = 650;  
    public static final Integer CREDIT_NORMS_LOW_CREDIT_SCORE_VALUE = 650;   
    public static final Integer COMMON_NORMS_NO_OF_PREVIOUS_MONTH_TO_CHECK = 6;
    public static final Integer RTR_NORMS_MIN_NO_OF_PREVIOUS_MONTH_TO_CHECK = 6;
    public static final Integer RTR_NORMS_MAX_NO_OF_PREVIOUS_MONTH_TO_CHECK = 12;
    public static final Integer COMMON_NORMS_MINIMUM_SANCTION_LOAN_AMOUNT_WITHOUT_INSURANCE = 1000000;
    public static final Integer COMMON_NORMS_MINIMUM_MATURITY_AGE = 75;
    public static final Integer COMMON_NORMS_MAXIMUM_MATURITY_AGE = 85;
    public static final Integer SAL_NORMS_COUNT_MINIMUM_SALARY_MONTH_FOR_SALARIED = 5;
    public static final Integer SAL_NORMS_COUNT_MITIGATION_MINIMUM_SALARY_MONTH_FOR_SALARIED = 3;
    public static final Integer SAL_NORMS_COUNT_MITIGATION_MINIMUM_SALARY_MONTH_FOR_PENSIONER = 3;
    public static final Integer SAL_NORMS_COUNT_DELAY_IN_SALARY_CREDIT = 1;
    public static final Integer SAL_NORMS_COUNT_MITIGATION_DELAY_IN_SALARY_CREDIT = 2;
    public static final Integer SELF_EMPLOYED_MIN_BUSINESS_STABILITY_IN_MONTHS = 36;
    public static final Integer SELF_EMPLOYED_MITIGATION_MIN_BUSINESS_STABILITY_IN_MONTHS = 24;

    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  MS Deviation Codes  __________________________________________
    
    //------------------------------------------------ Verification DM Codes -------------------------------------------
    public static final String DM_CODE_RESIDENCE_FI_VERIFICATION_NEGATIVE = 'DM 1';
    public static final String DM_CODE_OFFICE_FI_VERIFICATION_NEGATIVE = 'DM 2';
    public static final String DM_CODE_OFFICE_FI_VERIFICATION_NEGATIVE_AND_BANK_STATEMENT_REFUSED = 'DM 3';
    public static final String DM_CODE_DOCUMENT_VERIFICATION_INCOME_DOCUMENT_VERIFICATION_REFERRED = 'DM 4';
    public static final String DM_CODE_DOCUMENT_VERIFICATION_BANK_STATEMENT_REFERRED = 'DM 5';
    public static final String DM_CODE_DOCUMENT_VERIFICATION_ITR_DOCUMENT_REFERRED = 'DM 6';
    public static final String DM_CODE_DM_CODE_DOCUMENT_VERIFICATION_ALL_DOCUMENT_VERIFICATION_REFERRED = 'DM 7';
    //------------------------------------------------------------------------------------------------------------------
    
    //------------------------------------------------ CIBIL NORMS  DM Codes -------------------------------------------
    public static final String DM_CODE_CIBIL_NORMS_LOW_CIBIL_SCORE_VALUE = 'DM 21';
    public static final String DM_CODE_CIBIL_NORMS_60_DPD_LAST_1_YEAR = 'DM 26';
    public static final String DM_CODE_CIBIL_NORMS_30_DPD_LAST_6_MONTH = 'DM 27';
    public static final String DM_CODE_CIBIL_NORMS_60_PLUS_DPD_LAST_3_YEAR = 'DM 28';
    public static final String DM_CODE_CIBIL_NORMS_60_PLUS_DPD_LAST_MORE_THAN_3_YEAR = 'DM 29';
    public static final String DM_CODE_CIBIL_NORMS_WRITTENOFF_SUB_SMA_DBT_LSS_SETTLEMENT_OVERDUE_LAST_3_YEAR = 'DM 30';
    public static final String DM_CODE_CIBIL_NORMS_DPD_30_CREDIT_CARD = 'DM 31';
    public static final String DM_CODE_CIBIL_NORMS_DPD_90_CREDIT_CARD = 'DM 32';
    public static final String DM_CODE_CIBIL_NORMS_DPD_MORE_THAN_90_CREDIT_CARD = 'DM 33';
    public static final String DM_CODE_CIBIL_NORMS_WRITTENOFF_SUB_SMA_DBT_LSS_SETTLEMENT_OVERDUE_LAST_MORE_3_YEAR = 'DM 34';
    public static final String DM_CODE_CIBIL_NORMS_GUARANTEE_DEFAULT = 'DM 35';
    public static final String DM_CODE_CIBIL_NORMS_AGRICULTURE_LOAN = 'DM 36';
    //------------------------------------------------------------------------------------------------------------------
    
    //------------------------------------------------ BANKING POLICY NORMS DM Codes -----------------------------------
    public static final String DM_CODE_BANKING_NORMS_REASON_BOUNCED = 'DM 48';
    public static final String DM_CODE_BANKING_NORMS_REASON_TECHINCAL_BOUNCE = 'DM 49';
    public static final String DM_CODE_BANKING_NORMS_AVERAGE_BANK_BALANCE_LOW = 'DM 54';
    public static final String DM_CODE_BANKING_NORMS_AVERAGE_BANK_BALANCE_LOWEST = 'DM 55';
    //------------------------------------------------------------------------------------------------------------------
    
    //------------------------------------------------ COMMON POLICY NORMS DM Codes ------------------------------------
    public static final String DM_CODE_COMMON_NORMS_LOW_NET_ESTIMATE_INCOME = 'DM 9';
    public static final String DM_CODE_COMMON_NORMS_MINIMUM_INCOME_EARNER_AGE = 'DM 10';
    public static final String DM_CODE_COMMON_NORMS_LESS_TENOR_PAID = 'DM 25';
    public static final String DM_CODE_COMMON_NORMS_MATURITY_AGE_ALL_APPLICATION = 'DM 39';
    public static final String DM_CODE_COMMON_NORMS_BROTHER_OR_SISTER_ALL = 'DM 40';
    public static final String DM_CODE_COMMON_NORMS_BROTHER_OR_SISTER_ANY = 'DM 41';
    public static final String DM_CODE_COMMON_NORMS_SANCTION_LOAN_AMOUNT_LESS = 'DM 42';
    public static final String DM_CODE_COMMON_NORMS_SANCTION_LOAN_AMOUNT_MORE = 'DM 43';
    public static final String DM_CODE_COMMON_NORMS_LOAN_APPLICANTS_ALL_MALE = 'DM 50';
    public static final String DM_CODE_COMMON_NORMS_NO_LOAN_APPLICANTS_FOUND= 'DM 51';
    //------------------------------------------------------------------------------------------------------------------
    
    //------------------------------------------------ KYC NORMS DM Codes ----------------------------------------------
    public static final String DM_CODE_KYC_NORMS_AADHAR_MISSING = 'DM 8';

    //------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------ RTR POLICY DM Codes ---------------------------------------------
    public static final String DM_CODE_RTR_NORMS_1_BOUNCE = 'DM 46';
    public static final String DM_CODE_RTR_NORMS_MORE_THAN_1_BOUNCE = 'DM 47';
    //------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------ SAL POLICY DM Codes ---------------------------------------------
    public static final String DM_CODE_SAL_NORMS_MINIMUM_WORK_EXPERIENCE = 'DM 12';
    public static final String DM_CODE_SAL_NORMS_SALARY_ABOVE_SLABS = 'DM 13';
    public static final String DM_CODE_SAL_NORMS_FIRST_JOB_PROBATION = 'DM 19';
    public static final String DM_CODE_SAL_NORMS_CONTRACTUAL_EMPLOYMENT = 'DM 20';
    public static final String DM_CODE_SAL_NORMS_LESS_THAN_5_MONTH_SALARY = 'DM 22';
    public static final String DM_CODE_SAL_NORMS_DELAY_IN_SALARY_CREDIT = 'DM 23';
    //------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------ CREDIT POLICY DM Codes ------------------------------------------
    public static final String DM_CODE_CREDIT_NORMS_LOW_CREDIT_SCORE = 'DM 58';
    //------------------------------------------------------------------------------------------------------------------
    
    //------------------------------------------------ LEGAL POLICY DM Codes -------------------------------------------
    public static final String DM_CODE_LEGAL_NORMS_LOSS_OF_ORIGINAL_PRIOR_TITLE_DEED = 'DML 1';
    public static final String DM_CODE_LEGAL_NORMS_PREVIOUS_TITLE_DEED_IS_LOST = 'DML 2';
    public static final String DM_CODE_LEGAL_NORMS_LOAN_TERM_BEYOND_RESIDUAL_LEASE_PERIOD = 'DML 13';
    public static final String DM_CODE_LEGAL_NORMS_MUTATION_NOC_TO_MORTGAGE_NOT_AVAILABLE = 'DML 16';
    //------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------ TECHNICAL POLICY DM Codes -------------------------------------------
    public static final String DM_CODE_TECHNICAL_NORMS_MIXED_USAGE_OF_PROPERTY = 'DMT 2';
    public static final String DM_CODE_TECHNICAL_NORMS_PROPERTY_LOCATED_IN_UNDER_OR_UN_DEVELOPED_AREA = 'DMT 4';
    public static final String DM_CODE_TECHNICAL_NORMS_APPROACH_ROAD_LESS_THAN_REQUIRED = 'DMT 7';
    public static final String DM_CODE_TECHNICAL_NORMS_PROPERTY_AGE_LESS_THAN_REQUIRED_YEARS = 'DMT 8';  
    public static final String DM_CODE_TECHNICAL_NORMS_FOUR_BOUNDARIES_NOT_MATCHED = 'DMT 12';   
    public static final String DM_CODE_TECHNICAL_NORMS_UNDER_CONSTRUCTION_MULTI_STORY_BUILDING = 'DMT 18';
    public static final String DM_CODE_TECHNICAL_NORMS_DISBURSEMENT_AMOUNT_TOWARDS_PLOT_PURCHASE_EXCEEDING = 'DMT 23';
    public static final String DM_CODE_TECHNICAL_NORMS_PROPERTY_OCCUPIED_BY_TENANT = 'DMT 9';
    public static final String DM_CODE_TECHNICAL_NORMS_NON_SORP_PROPERTY_IN_LAP_CASES = 'DMT 10';
    public static final String DM_CODE_TECHNICAL_NORMS_OUTSIDE_DA_OR_NAGAR_NIGAM_LIMIT = 'DMT 6'; 
    public static final String DM_CODE_TECHNICAL_NORMS_ENHANCE_DISBURSEMENT_AGAINST_CURRENT_STAGE_1 = 'DMT 13'; 
    public static final String DM_CODE_TECHNICAL_NORMS_ENHANCE_DISBURSEMENT_AGAINST_CURRENT_STAGE_2 = 'DMT 14'; 
    public static final String DM_CODE_TECHNICAL_NORMS_CONSTRUCTION_RATE_CONSIDERED = 'DMT 15'; 
    public static final String DM_CODE_TECHNICAL_NORMS_BUILDING_PLAN_AND_PERMISSION_NOT_AVAILABLE = 'DMT 3'; 
    //------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------ SELF EMPLOYED DM Codes -------------------------------------------
    public static final String DM_CODE_SELF_EMPLOYED_BUSINESS_STABILITY = 'DM 16';
    public static final String DM_CODE_SELF_EMPLOYED_HOME_LOAN_ABOVE_20_LAKHS = 'DM 14';
    public static final String DM_CODE_SELF_EMPLOYED_LAP_LOAN_ABOVE_20_LAKHS = 'DM 15';
    public static final String DM_CODE_SELF_EMPLOYED_TURNOVER_DECREASING_NET_PROFIT_INCREASING = 'DM 17';
    public static final String DM_CODE_SELF_EMPLOYED_ITR_6_MONTH_GAP = 'DM 18';
    public static final String DM_CODE_SELF_EMPLOYED_INCOME_MULTIPLIER_UPTO_3_TIMES = 'DM 24';
    public static final String DM_CODE_SELF_EMPLOYED_TEMPORARY_BUSINESS_SETUP = 'DM 52';
    
    //__________________________________________________________________________________________________________________
    //------------------------------------------------------------------------------------------------------------------


    //__________________________________________________________________________________________________________________
    //__________________________________________________________________________________________________________________
    //---------------------------------------------( OBJECT SPECIFIC VARIABLES )----------------------------------------
    //__________________________________________________________________________________________________________________
    
    //__________________________________________________  Office FI ____________________________________________________
    public static final String OFFICE_FI_OVERALL_STATUS_POSITIVE = 'Positive';
    public static final String OFFICE_FI_STANDARD_REASON_REFUSED_BY_BANK = 'Refused By Bank';
    public static final String OFFICE_FI_STANDARD_REASON_ENTRY_RESTRICTED = 'Entry Restricted';
    //------------------------------------------------------------------------------------------------------------------
    
    
    //__________________________________________________  Account  _____________________________________________________
    public static final String ACCOUNT_OCCUPATION_SALARIED = 'Salaried';//used more than once
    public static final String ACCOUNT_OCCUPATION_TYPE_GOVERNMENT_SECTOR = 'Government Sector';
    public static final String ACCOUNT_OCCUPATION_TYPE_SELF_EMPLOYED = 'Self Employed';
    public static final Integer ACCOUNT_COMMOM_NORMS_MIN_AGE_SALARIED_PERSON = 21;
    public static final String ACCOUNT_INCOME_CONSIDERED_YES = 'Yes';
    public static final String ACCOUNT_INCOME_CONSIDERED_NO = 'No';
    public static final String ACCOUNT_PROPOSED_PROPERTY_OWNER_YES = 'Yes';
    public static final String ACCOUNT_PROPOSED_PROPERTY_OWNER_NO = 'No';
    public static final String ACCOUNT_EMPLOYMENT_STATUS = 'Confirmed';
    public static final Decimal ACCOUNT_MINIMUM_PRESENT_WORK_EXPERIENCE = 1;
    public static final String ACCOUNT_RELATION_BROTHER = 'Brother';
    public static final String ACCOUNT_RELATION_SISTER = 'Sister';
    public static final String ACCOUNT_TYPE_OF_INCOME_FORMAL = 'Formal';//used more than once
    public static final String ACCOUNT_EMPLOYMENT_STATUS_PROBATION = 'Probation';
    public static final Decimal ACCOUNT_SAL_MIN_PRESENT_WORK_EXPERIENCE = 1; //used more than once
    public static final Decimal ACCOUNT_SAL_MIN_TOTAL_WORK_EXPERIENCE = 2;
    public static final Decimal ACCOUNT_SAL_MIN_TOTAL_WORK_EXPERIENCE_FOR_CONTRACTUAL  = 3;
    public static final String ACCOUNT_MODE_OF_INCOME_CASH_SALARY = 'Cash Salary';
    public static final String ACCOUNT_QUALIFICATION_GRADUATE = 'Graduate';
    public static final String ACCOUNT_QUALIFICATION_PG = 'PG';
    public static final String ACCOUNT_QUALIFICATION_PROFESSIONAL = 'Professional';
    public static final String ACCOUNT_QUALIFICATION_UNDERGRADUATE = 'Undergraduate';
    public static final String ACCOUNT_QUALIFICATION_UP_TO_12TH = 'Up to 12th';
    public static final Set<String> ACCOUNT_SAL_QUALIFICATION_SET = new Set<String>{ ACCOUNT_QUALIFICATION_GRADUATE, ACCOUNT_QUALIFICATION_PG};//used more than once
    public static final Set<String> ACCOUNT_SAL_QUALIFICATION_TYPE_SET = new Set<String>{ 'Professional','Government Sector'};
    public static final String ACCOUNT_EMPLOYMENT_STATUS_CONTRACTUAL = 'Contractual';
    public static final String ACCOUNT_ELIGIBLE_FOR_PENSION_YES = 'Yes';
    public static final String ACCOUNT_BUSINESS_CONSTITUTION_PSU = 'PSU';
    public static final Set<String> ACCOUNT_BUSINESS_STRUCTURE_TYPE_TEMPORARY_SET = new Set<String>{ 'Temporary' };
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  Application  _________________________________________________
    public static final String APPLICATION_PRODUCT_HOME_EQUITY = 'Home Equity'; //used more than once
    public static final String APPLICATION_PRODUCT_HOME_LOAN = 'Home Loan';
    public static final String APPLICATION_STAGE_BRANCH_MANAGER_REVIEW = 'Branch Manager Review';
    public static final String APPLICATION_STAGE_CREDIT_MANAGER_REVIEW = 'Credit Team Review';
    public static final String APPLICATION_SUB_STAGE_REJECTED = 'Rejected';
    public static final String APPLICATION_SUB_STAGE_INCOME_AND_LIABILITY_REPORT = 'Income And liability Report';
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  Customer Application(Loan Applicant)  ________________________
    public static final String CUSTOMER_APPLICATION_APPLICATION_TYPE_CO_APPLICANT = 'Co Applicant';
    public static final String CUSTOMER_APPLICATION_APPLICATION_TYPE_MAIN_APPLICANT = 'Main Applicant';
    //------------------------------------------------------------------------------------------------------------------
    //__________________________________________________  Residence FI _________________________________________________
    public static final String RESIDENCE_FI_OVERALL_STATUS_POSITIVE = 'Positive';
    public static final String RESIDENCE_FI_THIRD_PARTY_STATUS_POSITIVE = 'Positive';
    
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  Cibil Report _________________________________________________
    public static final String CIBIL_REPORT_ACCOUNT_TYPE_GOLD_LOAN = 'Gold Loan';
    public static final String CIBIL_REPORT_ACCOUNT_TYPE_CONSUMER_LOAN = 'Consumer Loan';
    public static final String CIBIL_REPORT_ACCOUNT_TYPE_CREDIT_CARD = 'Credit Card';
    public static final Set<String> CIBIL_API_CIBIL_ACCOUNT_TYPE_IGNORE = new Set<String>{
        CIBIL_REPORT_ACCOUNT_TYPE_GOLD_LOAN,CIBIL_REPORT_ACCOUNT_TYPE_CONSUMER_LOAN};
    public static final String CIBIL_REPORT_WRITTEN_OFF = 'Written';
    public static final String CIBIL_REPORT_SETTLED = 'Settled';
    public static final String CIBIL_REPORT_OWENERSHIP_GUARANTOR = 'Guarantor';
    public static final Set<String> CIBIL_API_CIBIL_ACCOUNT_TYPE_AGRICULTURE= new Set<String>{ 'Tractor Loan','Kisan Credit Card','Business Loan – Priority Sector – Agriculture','Business Non-Funded Credit Facility – Priority Sector – Agriculture' };
    public static final Map<String,String> mapWrittenAndSettledStatus = new Map< String,String >{
        '00' => 'Restructured Loan','01' => 'Restructured Loan (Govt.Mandated)','02' => CIBIL_REPORT_WRITTEN_OFF ,'03' => CIBIL_REPORT_SETTLED,
            '04' => 'Post (WO) Settled','05' => 'Account Sold','06' => 'Written Off and Account Sold','07' => 'Account Purchased',
            '08' => 'Account Purchased and Written Off','09' => 'Account Purchased and Settled','10' => 'Account Purchased and deploRestructured',
            '11' => 'Restructured due to Natural Calamity'};        
            
                public static final Map<String,String> MAP_CIBIL_REPORT_LOAN_OWNERSHIP_INDICATOR = new Map< String,String >{   
                '1' => 'Individual','2' => 'Authorised User (refers to supplementary credit card holder)','3' => CIBIL_REPORT_OWENERSHIP_GUARANTOR,'4' => 'Joint'};         
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  Repayment Track ______________________________________________
    public static final String REPAYMENT_TRACK_STATUS_CLEARED = 'Cleared';
    public static final String REPAYMENT_TRACK_STATUS_BOUNCED = 'Bounced';
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  PaySlip ___________________________________________________
    public static final String PAYSLIP_STATUS_BOUNCED = 'Bounced';
    public static final String PAYSLIP_REASON_BOUNCED = 'Bounced';
    public static final String PAYSLIP_REASON_TECHNICAL = 'Technical';
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  Liability Details ____________________________________________
    public static final String LIABILITY_DETAIL_OBLIGATION_UNDER_BT = 'Under BT';
    public static final Decimal LIABILITY_DETAIL_MINIMUM_TENOR_PAID = 9;
    public static final Decimal LIABILITY_DETAIL_MINIMUM_TENOR_PAID_2 = 6;
    //------------------------------------------------------------------------------------------------------------------

    //__________________________________________________  Technical Verification ___________________________________
    public static final String TECHNICAL_VERIFICATION_IS_IT_SELF_OCCUPIED_PROPERTY_YES = 'Yes';
    public static final String TECHNICAL_VERIFICATION_PROPERTY_BOUNDARIES_MATCH_NO = 'No';
    public static final String TECHNICAL_VERIFICATION_IS_IT_SELF_OCCUPIED_PROPERTY_NO = 'No';
    public static final Set<String> TECHNICAL_VERIFICATION_SET_TECHNICAL_NORMS_MIXED_USAGE_OF_PROPERTY_TYPES = new Set<String>{
       'SHOP','OFFICE','Resi cum Commercial','industrial'
    };
    public static final String TECHNICAL_VERIFICATION_RESIDENTIAL_DEVELOPMENT_LEVEL_LESS_THAN_30 = 'Less than 30%';
    public static final String TECHNICAL_VERIFICATION_RESIDENTIAL_DEVELOPMENT_LEVEL_40 = '40%';
    public static final Integer TECHNICAL_VERIFICATION_FRONT_ROAD_WIDTH_MINIMUM_1 = 9;
    public static final Integer TECHNICAL_VERIFICATION_FRONT_ROAD_WIDTH_MINIMUM_2 = 4;
    public static final Integer TECHNICAL_VERIFICATION_PROPERTY_MINIMUM_AGE = 10;
    public static final Decimal TECHNICAL_VERIFICATION_STAGE_OF_CONSTRUCTION_BUILDING_MIN_VAL = 80;
    public static final Decimal TECHNICAL_VERIFICATION_STAGE_OF_CONSTRUCTION_UNIT_FUNDED_MIN_VAL = 0;
    public static final String TECHNICAL_VERIFICATION_PROPERTY_TYPE_FLAT_UNDER_CONSTRUCTION = 'Flat - Under Construction';
    public static final String TECHNICAL_VERIFICATION_IF_NO_WHO_OWNS_THE_PROPERTY_TENNANT = 'Tennant';
    public static final String TECHNICAL_VERIFICATION_AUTHORITY_LIMIT_GRAM_PANCHAYAT = 'Gram Panchayat';
    public static final Decimal TECHNICAL_VERIFICATION_BUILT_UP_AREA_MAX_VALUE = 1200;
    
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________ Technical Verification Document ___________________________
    public static final String TECHNICAL_VERIFICATION_DOC_DOCUMENT_NAME_T_AND_CP_LAYOUT_PERMISSION = 'T and CP Layout/Permission';
    public static final Set<String> TECHNICAL_VERIFICATION_DOC_BUILDING_PLAN_AND_PERMISSION_DOC_NAMES = new Set<String>{
        'Approved Plan & Permits','Approved Layout/Letter','T and CP Layout/Permission','Regularization Certificate'
    };
    
    //------------------------------------------------------------------------------------------------------------------

    //__________________________________________________  Documentation Verification Details ___________________________
    public static final String DOC_VERIF_DETAILS_STATUS_POSITIVE = 'Positive';
    public static final String DOC_VERIF_DETAILS_STATUS_REFERRED = 'Referred to Credit';
    public static final Set<String> DOC_VERIF_DETAILS_SET_INCOME_DOCUMENTS_SUFFIX = new Set<String>{
        'Form 16','Salary Slips/Certificate'};
    public static final Set<String> DOC_VERIF_DETAILS_BANK_STATEMENT_SUFFIX = new Set<String>{
                BANK_SALARY_ACCOUNT_SUFFIX,'Bank statement (Savings Account)','Bank statement (Current Account)','Bank statement (OD/CC Account)'};
     public static final Set<String> DOC_VERIF_DETAILS_ITR_DOCUMENT_SUFFIX = new Set<String>{
                        'Income Tax Returns' };
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  Salary Income For Assessment _________________________________
    public static final Integer SALARY_INCOME_ASSESSMENT_MINIMUM_NET_ESTIMATE_INCOME_FOR_SINGLE_APPLICANT = 7000;
    public static final Integer SALARY_INCOME_ASSESSMENT_MINIMUM_NET_ESTIMATE_INCOME_FOR_ALL_APPLICANT = 10000;
    public static final Integer SALARY_INCOME_ASSESSMENT_SAL_POLICY_MINIMUM_NET_SALARY_PG_OR_GRADUATE_HEAD_BRANCH = 20000;
    public static final Integer SALARY_INCOME_ASSESSMENT_SAL_POLICY_MINIMUM_NET_SALARY_PG_OR_GRADUATE_MINI_BRANCH = 12000;

    public static final Integer SALARY_INCOME_ASSESSMENT_SAL_POLICY_MINIMUM_NET_SALARY_UNDERGRADUATE_HEAD_BRANCH = 15000;
    public static final Integer SALARY_INCOME_ASSESSMENT_SAL_POLICY_MINIMUM_NET_SALARY_UNDERGRADUATE_MINI_BRANCH = 12000;
    
    public static final Integer SALARY_INCOME_ASSESSMENT_SAL_POLICY_MINIMUM_NET_SALARY_UPTO_12_HEAD_BRANCH = 12000;
    public static final Integer SALARY_INCOME_ASSESSMENT_SAL_POLICY_MINIMUM_NET_SALARY_UPTO_12_MINI_BRANCH = 8000;
    
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  PD Visit  ____________________________________________________
    public static final String PD_VISIT_NEGATIVE_PROFILE_YES = 'Yes';
    public static final String PD_VISIT_FIRST_HOME_BUYER_NO = 'No';
    public static final String PD_VISIT_FIRST_END_USE_PLOT_CONSTRUCTION = 'Plot+Construction';
    public static final Set<String> PD_VISIT_END_USE_FOR_SET_LOSS_OF_ORIGINAL_PRIOR_TITLE_DEED = new Set<String>{
        'Plot+Construction','House Purchase','Resale Purchase','Flat Purchase' };//used more than once
    public static final Decimal PD_VISIT_MAX_STAYING_SINCE_FOR_CURRENT_ADDRESS_FOR_LEGAL_DEVIATION = 5;
    public static final String PD_VISIT_LOAN_TYPE_HOME_LOAN = 'Home Loan';
    public static final String PD_VISIT_LOAN_TYPE_HOME_EQUITY = 'Home Equity';
    //------------------------------------------------------------------------------------------------------------------

    //__________________________________________________  Legal Report Provisions  ____________________________________________________
    public static final String LEGAL_REPORT_PROVISIONS_LEGAL_NORMS_MUTATION_NOC_TO_MORTGAGE_NOT_AVAILABLE_CRETERIA_CONDITION = 'Whether the property is lease land ?if yes, then what is the residual tenure(in years) of the lease ?';//used more than once
    public static final String LEGAL_REPORT_PROVISIONS_ANSWER_YES = 'Yes'; //used more than once
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  Branch  ______________________________________________________
    public static final String BRANCH_TYPE_OF_BRANCH_HEAD = 'Head';
    public static final String BRANCH_TYPE_OF_BRANCH_MINI = 'Mini';
    //------------------------------------------------------------------------------------------------------------------
    
    //__________________________________________________  Income Assessment  ______________________________________________________
    public static final String INCOME_ASSESSMENT_RECORDTYPE_ASSESSED_INCOME_PROGRAM = 'Assessed_Income_Program';
    public static final String INCOME_ASSESSMENT_RECORDTYPE_REGULAR_ITR_PROGRAM = 'Regular_ITR_Program';
    public static final String INCOME_ASSESSMENT_RECORDTYPE_LIQUID_INCOME_PROGRAM = 'Liquid_Income_Program';
    //------------------------------------------------------------------------------------------------------------------

    //__________________________________________________  Document Placed  _____________________________________________
    public static final String  DOCUMENT_PLACED_STATUS_MISSING = 'Missing';
    public static final String  DOCUMENT_PLACED_STATUS_WAIVED = 'Waived';
    public static final Set<String> DOCUMENT_PLACED_SET_LOSS_OF_ORIGINAL_PRIOR_TITLE_DEED_NAMES = new Set<String>{
       'Sale Deed','Registered Agreement To Sale','Lease Deed','Partition Deed','Gift Deed','Release Deed / Relinquishment Deed',
        'Co-ownership Deed','Conveyance Deed', 'Registered Will','Notarised Will','Patta Vilekh / Deed' };

    public static final Set<String> DOCUMENT_PLACED_SET_MUTATION_NOC_TO_MORTGAGE_NOT_AVAILABLE = new Set<String>{ 'NOC to Mortgage from DA / Houseboard' };
         
    //------------------------------------------------------------------------------------------------------------------

    //__________________________________________________  Disbursal Detail  _____________________________________________
    public static final String  DISBURSAL_DETAIL_TRANSACTION_TYPE_PLOT = 'Plot';
    public static final String  DISBURSAL_DETAIL_TRANSACTION_TYPE_SELF_CONSTRUCTION = 'Self Construction';
    public static final Decimal  DISBURSAL_DETAIL_DEVIATION_ON_RECOMMENDATION_PERCENTAGE_10 = 10;
    //------------------------------------------------------------------------------------------------------------------

    //__________________________________________________  RCU DOCUMENTS  _______________________________________________
    public static final String  STATUS_SCREEN = 'Screen';
    public static final String  STATUS_HOLD = 'Hold';
    public static final String  STATUS_SAMPLE = 'Sample';
    public static final String  STATUS_RCU_VERIFIED = 'RCU Reviewed';
    public static final String STATUS_RCUAPI_VERIFIED = 'API Verified & RCU Reviewed';
    public static final String  STATUS_NEW = 'New';
    public static final String  STATUS_API_VERIFIED = 'API Verified';
    public static final String  SUCCESS_KEY = 'SUCCESS';
    public static final String  AADHAAR = 'AADHAAR';
    public static final String  PAN = 'PAN';
    public static final String  DRIVING_LICENSE = 'DRIVING LICENSE';
    public static final String  PASSPORT = 'PASSPORT';
    public static final String  VOTER_ID_CARD = 'VOTER ID CARD';
    public static final String RCU_REC_TYPE = 'RCU';
    public static final String RCU_RESIDENTIAL_TYPE = 'RCU Residential FI';
    public static final String RCU_OFFICE_TYPE = 'RCU Office FI';
    public static final String APPROVED = 'Approved';
    public static final String DECLINED = 'Declined';
    public static final String SUBMITTED_TO_VENDOR = 'Submitted To Vendor';
    public static final String SUBMITTED_BY_VENDOR = 'Submitted By Vendor';
    //------------------------------------------------------------------------------------------------------------------
	
    
    //******************************************Disburment Information**************************************************
    public static final String APPROVE_STATUS = 'Approve';
    public static final String DECLINE_STATUS = 'Decline';
    public static final String REVIEW_STATUS = 'Review';
    /*******Vendor Request Recordtypes********/
    public static final String REC_TYPE_LEGAL = 'Legal';
    
}//ENd of class