*** Settings ***
Library    DatabaseLibrary
Library    String
Library    Dialogs
Suite Setup    Connect
Suite Teardown    Disconnect
*** Variables ***
${DB_NAME}    TestDB
${DB_USER_NAME}    testuser
${DB_USER_PASSWORD}    test123
${DB_HOST}    CPX-CMSUMI7OH6Y
${DB_PORT}    1433
${PREVIOUS_ROW_COUNT}
${DATATOLOAD}    dataToLoad
${FIRSTNAME}    FirstName
${LASTNAME}    LastName
*** Test Cases ***
Insert a Record
    Get Input Data
    Insert Record
    

Verify the Table Exists
    Verify Table
    

Verify the Table Records
    Verify Records
    
*** Keywords ***
Connect
    [Tags]    TestDB
    Connect to Database    pymssql    ${DB_NAME}    ${DB_USER_NAME}    ${DB_USER_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    

Disconnect
    [Tags]    TestDB
    Delete All Rows From Table    TestTable
    Delete All Rows From Table    Person
    Disconnect From Database
    

Get Input Data
    [Tags]    TestDB
    ${dataToLoad} =     Get Value From User    Enter Data
    ${FirstName} =     Get Value From User    Enter First Name    
    ${LastName} =     Get Value From User    Enter Last Name    
    

Insert Record
    [Tags]    TestDB
    Execute Sql String    insert into TestTable (Name, TextData, Num) values ('${DATATOLOAD}','${DATATOLOAD}', 0)
    Execute Sql String    insert into Person (First_Name, Last_Name) values ('${FIRSTNAME}','${LASTNAME}')    
    

Verify Table
    [Tags]    DBTests
    Table Must Exist    TestTable    
    Table Must Exist    Person    
    

Verify Records
    [Tags]    DBTests
    Check If Exists In Database    select * from Person where First_Name = '${FIRSTNAME}' and Last_Name = '${LASTNAME}'
    Row Count Is Equal To X    select * from Person    1
    Row Count Is 0    select * from Person where First_Name = '${DATATOLOAD}'            
    
 
    