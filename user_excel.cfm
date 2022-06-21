<cfobject component="cfc/user" name="userExcel">
<cfinvoke component="#userExcel#" method="getUserLists" returnvariable="getUserExcel"></cfinvoke>
<cfset variables.theSheet = SpreadsheetNew("ContactData")>
<cfset SpreadsheetAddRow(variables.theSheet, "FirstName,LastName,Address,Email,Phone,DOB,Role")>
<cfset SpreadsheetAddRows(variables.theSheet,variables.getUserExcel)>
<cfheader name="Content-Disposition" value="inline; filename=Template_with_data.xlsx">
<cfcontent type="application/vnd.ms-excel" variable="#SpreadSheetReadBinary(variables.theSheet)#">