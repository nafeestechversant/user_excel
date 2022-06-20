<!-- Set the value of MyDatabase to be the name you published the database under -->
<cfcomponent output="false">
    <cfset this.name = '' />	  	 
    <!---OnApplicationStart() method--->
	<cffunction name="onApplicationStart" returntype="boolean" >
						
		<cfreturn true />
	</cffunction>
    <!---onRequestStart() method--->
	<cffunction name="onRequestStart" returntype="boolean">		
		
		<cfreturn true />
	</cffunction>

	<cffunction name="onSessionStart" access="public" output="false" returntype="void">     	    
			 	
	</cffunction>

	<cffunction name="onMissingTemplate">
        <cfargument name="targetPage" type="string" required=true/>
        <cftry>            
            <cflog type="error" text="Missing template: #Arguments.targetPage#">            
             <cfoutput> 
                 <h3>#Arguments.targetPage# could not be found.</h2> 
                 <p>You requested a non-existent ColdFusion page.<br /> 
                 Please check the URL.</p> 
             </cfoutput> 					 
            <cfreturn true />         
            <cfcatch>
                <cfreturn false />
            </cfcatch>
        </cftry>

    </cffunction>

	<cffunction name="onError"> 
		<cfargument name="Exception" required=true/> 
		<cfargument type="String" name="EventName" required=true/> 				 		
		<cfif NOT (Arguments.EventName IS "onSessionEnd") OR  
				(Arguments.EventName IS "onApplicationEnd")> 
 				<cfoutput> 
 					<h2>An unexpected error occurred.</h2> 
 					<p>Please provide the following information to technical support:</p> 
 					<p>Error Event: #Arguments.EventName#</p> 
 					<p>Error details:<br> 
 					<cfdump var=#Arguments.Exception#></p> 
 				</cfoutput>  							 
		</cfif>  
	</cffunction>		 	
</cfcomponent>
