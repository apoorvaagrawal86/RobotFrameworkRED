***Settings***
Library    SeleniumLibrary    
Test Teardown    Close Browser
       

*** Test Cases ***
OrangeHRMLoginTest
    Open Browser    ${URL}    Chrome
    Set Browser Implicit Wait    5
    Title Should Be    OrangeHRM
    Input Text    id=txtUsername    &{LOGINDATA}[username]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin
    Element Text Should Be    id=welcome    Welcome Admin
    

AddEmployee   
    LoginTestKW
    Click Element    xpath=//b[contains(text(),'PIM')]    
    Click Element    id=menu_pim_addEmployee
    Element Text Should Be    xpath=//h1    Add Employee  
    Input Text    id=firstName    &{EMPNAMEDATA}[firstname]
    Input Text    id=lastName    &{EMPNAMEDATA}[lastname]
    ${empId}=    Get Text    id=employeeId
    Log To Console    Employee ID is ${empId}        
    Click Element    id=chkLogin
    Input Text    id=user_name    &{EMPLOGINDATA}[username]
    Input Text    id=user_password    &{EMPLOGINDATA}[password]
    Input Text    id=re_password    &{EMPLOGINDATA}[password]
    Click Button    id=btnSave
    Click Element    id=menu_pim_viewEmployeeList
    Input Text    id=empsearch_id    ${empId}
    Click Button    id=searchBtn
    Element Text Should Be    xpath=//table[@id='resultTable']/tbody/tr/td[3]/a[contains(text(),'FName')]   &{EMPNAMEDATA}[firstname]
    Element Text Should Be    xpath=//table[@id='resultTable']/tbody/tr/td[4]/a[contains(text(),'LName')]   &{EMPNAMEDATA}[lastname]
    Click Element    xpath=//table[@id='resultTable']/tbody/tr/td[1]/input[@type='checkbox']
    Click Button    id=btnDelete                 
           
                       
    
            



***Variables***
${URL}    https://opensource-demo.orangehrmlive.com/index.php/auth/login
&{LOGINDATA}    username=Admin    password=admin123
&{EMPLOGINDATA}    username=User1Test    password=P@ssw0rd
&{EMPNAMEDATA}    firstname=FName    lastname=LName



***Keywords***
LoginTestKW
    Open Browser    ${URL}    Chrome
    Title Should Be    OrangeHRM
    Input Text    id=txtUsername    &{LOGINDATA}[username]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin
    Element Text Should Be    id=welcome    Welcome Admin