<cfcomponent>
    <cffunction name="uploadExcel" access="remote" output="false">        
        <cfset local.errMsg = true>
        <cfif structKeyExists(form, "fld_userExcel") and len(form.fld_userExcel)>        
            <cfset variables.dest = expandPath("../upload")>
            <cffile action="upload" destination="#variables.dest#" filefield="fld_userExcel" result="upload" nameconflict="makeunique">
            <cfif upload.fileWasSaved>
                <cfset theFile = upload.serverDirectory & "/" & upload.serverFile>
                <cfif isSpreadsheetFile(theFile)>
                    <cfspreadsheet action="read" src="#theFile#" query="excelData" headerrow="1">
                    <cfset local.errMsg = false>
                <cfelse>
                    <cfset errors = "The file was not an Excel file.">
                    <cffile action="delete" file="#theFile#">
                </cfif> 
                <cfif excelData.recordCount is 1>
                    <cfset errors = "This spreadsheet appeared to have no data.">
                <cfelse>
                    <cfloop query="excelData" startrow="2">               
                        <cfquery result="foobar">
                            INSERT INTO user_details (user_firstname,user_lastname,user_address,user_email,user_phone,user_dob,user_role)
                                VALUES (
                                        <cfqueryparam value="#FirstName#" cfsqltype="cf_sql_varchar" />,
                                        <cfqueryparam value="#LastName#" cfsqltype="cf_sql_varchar" />,
                                        <cfqueryparam value="#Address#" cfsqltype="cf_sql_varchar" />,						
                                        <cfqueryparam value="#Email#" cfsqltype="cf_sql_varchar" />,
                                        <cfqueryparam value="#Phone#" cfsqltype="cf_sql_varchar" />	,
                                        <cfqueryparam value="#DateFormat(DOB,"yyyy-mm-dd")#" cfsqltype="cf_sql_varchar" />,	
                                        <cfqueryparam value="#Role#" cfsqltype="cf_sql_varchar" />																					
                                    )
                        </cfquery>                
                    </cfloop>
                </cfif>	
            </cfif>                                 
        </cfif>
          <cfreturn #excelData# />  
    </cffunction>
     <cffunction name="getUserLists" access="public" output="false" returntype="query">		
		<cfquery name="qry.rs_getUserLists">
			SELECT user_firstname,user_lastname,user_address,user_email,user_phone,user_dob,user_role FROM user_details ORDER BY user_id DESC
		</cfquery>		
		<cfreturn qry.rs_getUserLists />
	</cffunction>
    <cffunction name="getUserExcel" access="public" output="false" returntype="query">		
		<cfquery name="qry.rs_getUserExcel">
			SELECT firstname,contact_email,contact_phone,address,street,pincode FROM contact WHERE user_id = <cfqueryparam value="#session.stLoggedInUser.userID#" cfsqltype="cf_sql_integer" /> ORDER BY contact_id
		</cfquery>
		<cfreturn qry.rs_getUserExcel />
	</cffunction>
</cfcomponent>