<cfif structKeyExists(Form,"formSubmit")>     
  <cfinvoke component="cfc/user" method="uploadExcel" returnvariable="excelData"></cfinvoke>    
</cfif>
<cfinvoke component="cfc/user" method="getUserLists" returnvariable="UserLists"></cfinvoke>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>User Details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">       
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">        
    </head>
    <body>
        <cfoutput> 
            <div class="event-schedule-area-two bg-color pad100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title text-center">
                                <div class="title-text">
                                    <h2>User Information</h2>
                                </div>
                            </div>
                        </div>
                        <!-- /.col end-->
                    </div>
                    <!-- row end-->
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="nav custom-tab" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <div class="primary-btn">
                                        <a class="btn btn-primary clr1" href="upload/Plain_Template.xlsx">Plain Template</a>
                                    </div>
                                </li>
                                <li class="nav-item mright-3">
                                    <div class="primary-btn">
                                        <a class="btn btn-primary clr2" href="user_excel.cfm">Template with data</a>
                                    </div>
                                </li>
                                <form id="" method= "POST" action="" enctype="multipart/form-data">
                                    <li class="nav-item">
                                        <div class="primary-btn">
                                            <input type="file"  class="" name="fld_userExcel" id="fld_userExcel"  /> 
                                            <a class="btn btn-primary clr3" id="upload_link">Browse</a>
                                        </div>
                                    </li>
                                    <li class="nav-item d-none d-lg-block">
                                        <div class="primary-btn">
                                            <input type="submit" class="btn btn-primary clr4" name="formSubmit" value="Upload">
<!---                                              <a class="btn btn-primary clr4" href="##">Upload</a>  --->
                                        </div>
                                    </li>
                                </form>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade active show" id="home" role="tabpanel">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center" scope="col">FirstName</th>
                                                    <th scope="col">LastName</th>
                                                    <th scope="col">Address</th>
                                                    <th scope="col">Email</th>
                                                    <th class="text-center" scope="col">Phone</th>
                                                    <th class="text-center" scope="col">DOB</th>
                                                    <th class="text-center" scope="col">Role</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <cfloop query="#UserLists#">
                                                    <tr class="inner-box">
                                                        <td>
                                                            <div class="r-no">
                                                                <span>#UserLists.user_firstname#</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="r-no">
                                                                <span>#UserLists.user_lastname#</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="r-no">
                                                                <span>#UserLists.user_address#</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="r-no">
                                                                <span>#UserLists.user_email#</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="r-no">
                                                                <span>#UserLists.user_phone#</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="r-no">
                                                                <span>#DateFormat(UserLists.user_dob,"dd/mm/yyyy")#</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="r-no">
                                                                <span>#UserLists.user_role#</span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </cfloop>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>                         
                        </div>
                        <!-- /col end-->
                    </div>
                    <!-- /row end-->
                </div>
            </div>
        </cfoutput> 
        <script src="js/jquery-1.10.2.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>