***Settings***
Library    SeleniumLibrary    
Test Teardown    Close Browser
       

*** Test Cases ***
OrangeHRMLoginTest
    Open Browser    ${URL}    Chrome
    Title Should Be    OrangeHRM
    Input Text    id=txtUsername    &{LOGINDATA}[username]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin
    Element Text Should Be    id=welcome    Welcome Admin        
    
            



***Variables***
${URL}    https://opensource-demo.orangehrmlive.com/index.php/auth/login
&{LOGINDATA}    username=Admin    password=admin123