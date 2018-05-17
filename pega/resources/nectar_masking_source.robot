*** Settings ***
Variables                   ../config/__init__.py



*** Variables ***
##webvariables
#
${pega_login_url}                                ${SETTINGS['pega_url']}
${pega_login_uid}                                ${SETTINGS['pega_uid']}
${pega_login_pwd}                                ${SETTINGS['pega_pwd']}
${wait_for_button_timeout}                       3s

${pega_xpath_mainpage}                          //*[@id="RULE_KEY"]/div/div/div/div[1]/div/div/div/div/div/div/div/span/i/img

${pega_xpath_uid}                               //*[@id="txtUserID"]
${pega_xpath_pwd}                               //*[@id="txtPassword"]
${pega_xpath_clicksubmitbtn}                    //*[@id="sub"]

${pega_xpath_selectpage_frame}                  //iframe[contains(@id,'PegaGadget')]

${pega_xpath_view_open_complaints}              //*[@id="RULE_KEY"]/div[2]/div/div/div[2]/div/div/span/button/div/div/div/div

${pega_xpath_select_complaints_record}          //*[@id="$PpgRepPgSubSectionInstoreCasesListBB$ppxResults$l1"]/td[1]/div/span/a


${pega_xpath_select_instore_complaints}         //*[@id="RULE_KEY"]/div[2]/div/div/div/div/div/div/div/span[3]/label


${pega_xpath_click_save_continue}               //*[@id="RULE_KEY"]/div/div/div/div/div/div/div/div/div[2]/div/div/div/div/div/div/div/span/button/div/div/div/div


${pega_xpath_click_service_type}                //*[@id="CT"]/div/div/span[3]/label
${pega_xpath_click_next_action}                 //*[@id="EXPAND-OUTERFRAME"]/div[2]/div/div[4]/div/div/div/div/span[1]/label

${pega_xpath_click_search_cust}                 //*[@id="RULE_KEY"]/div[2]/div/div/div/div/div/div/div/span[2]/label


${pega_xpath_click_name_postcode}               //*[@id="RULE_KEY"]/div[1]/div/div/div[3]/div[1]/h3

${validate_current_page}                        Welcome to Customer Feedback
${validate_content_page1}                       Open Complaints
${validate_content_page2}                       What type of complaint is it?
${validate_content_page3}                       What does the complaint relate to?
${validate_content_page4}                       Give us a few details about the complaint
${validate_content_page5}                       Associate complaint to a customer?
${validate_content_page6}                       Check the complaint details before submitting



${xpath_cust_last_name}                         //*[@id="LastName"]
${cust_last_name}                               kumar

${xpath_cust_post_code}                         //*[@id="PostCode"]
${cust_post_code}                               CV2 2SJ

${xpath_click_cust_search}                      //*[@id="RULE_KEY"]/div[1]/div/div/div[3]/div[2]/div/div[3]/div/div/span/button/div/div/div/div


${pega_xpath_nectar_card_no}                    //*[@id="$PD_SearchCustomer_pa8095196407104859pz$ppxResults$l9"]/td[6]/div

${pega_xpath_select_cust_record}                //*[@id="$PD_SearchCustomer_pa8143173434918859pz$ppxResults$l1"]/td[2]/div/span

#//*[@id="$PD_SearchCustomer_pa8135995966324859pz$ppxResults$l1"]/td[1]
#//*[@id="$PD_SearchCustomer_pa8135995966324859pz$ppxResults$l1"]


*** Keywords ***
Login into csrinstore app

         [Documentation]                 login into csrinstore app
         [Tags]

        go to                                ${pega_login_url}
        capture page screenshot
        wait until element is visible       ${pega_xpath_uid}           ${wait_for_button_timeout}
        input text                           ${pega_xpath_uid}      ${pega_login_uid}
        capture page screenshot
        wait until element is visible       ${pega_xpath_pwd}           ${wait_for_button_timeout}
        input password                      ${pega_xpath_pwd}      ${pega_login_pwd}
        click button                        ${pega_xpath_clicksubmitbtn}
        wait until page contains element    ${pega_xpath_mainpage}

Select Frame1
       Select Frame                        ${pega_xpath_selectpage_frame}
Select View Open Complaints

        Select Frame1
        Wait Until Page Contains            ${validate_current_page}
        wait until element is visible       ${pega_xpath_view_open_complaints}
        Click Element                       ${pega_xpath_view_open_complaints}
        Wait Until Page Contains            ${validate_content_page1}
        Capture Page ScreenShot
        Click Element                      ${pega_xpath_select_complaints_record}
        Unselect Frame

        sleep   3s
        Select Frame                        //*[@id="PegaGadget1Ifr"]
        Wait Until Page Contains           ${validate_content_page2}


        wait until element is visible      ${pega_xpath_select_instore_complaints}
        Click Element                      ${pega_xpath_select_instore_complaints}

        click Element                      ${pega_xpath_click_save_continue}

        Wait Until Page Contains           ${validate_content_page3}
        Capture Page ScreenShot
#        Select Frame1


        wait until element is visible      ${pega_xpath_click_service_type}
        click element                      ${pega_xpath_click_service_type}
        wait until element is visible      ${pega_xpath_click_save_continue}      10s
        click Element                      ${pega_xpath_click_save_continue}

        Wait Until Page Contains           ${validate_content_page4}        10s
        Capture Page ScreenShot

        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        wait until element is visible      ${pega_xpath_click_next_action}      10s
        click element                      ${pega_xpath_click_next_action}

        wait until element is visible      ${pega_xpath_click_save_continue}      10s
        click Element                      ${pega_xpath_click_save_continue}

        Wait Until Page Contains           ${validate_content_page5}        10s
        Capture Page ScreenShot

        wait until element is visible       ${pega_xpath_click_search_cust}  10s
        click element                       ${pega_xpath_click_search_cust}

        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Wait Until Element is visible       ${xpath_cust_last_name}         10s
        input text     ${xpath_cust_last_name}     ${cust_last_name}

        input text     ${xpath_cust_post_code}     ${cust_post_code}
        capture page screenshot
        sleep   10s
        wait until element is visible       ${xpath_click_cust_search}      20s
        click element                       ${xpath_click_cust_search}

        wait until page contains            Matching Customers      15s
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        capture page screenshot
#        wait until element is visible       ${pega_xpath_select_cust_record}    20s
#        click element                       ${pega_xpath_select_cust_record}

        wait until element is visible       ${pega_xpath_nectar_card_no}        20s
        ${nectar_card_number}=              get text  ${pega_xpath_nectar_card_no}
        log                                 ${nectar_card_number}
#        sleep   10s
#        wait until element is visible       //*[contains(text(), 'Kumar')]       10s
#        click element                       //*[contains(text(), 'Kumar')]
#        wait until element is visible       ${pega_xpath_click_save_continue}    10s
#        click Element                      ${pega_xpath_click_save_continue}
#
#        wait until page contains            ${validate_content_page6}   20s
        capture page screenshot
##
#        wait until element is visible       ${pega_xpath_nectar_card_no} 10s
#        ${nectar_card_number}=           get text  ${pega_xpath_nectar_card_no}
#        log                                 ${nectar_card_number}
##        should be equal  ${nectar_card_number}      \\*\\*\\*\\*\\*\\d+
#        ${result}=  Get Regexp Matches    ${nectar_card_number}   \\*\\*\\*\\*\\*\\d+
#        log  ${result}












