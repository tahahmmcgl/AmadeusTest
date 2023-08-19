Feature: AmadeusApiTest
  Background:
    * url AmadeusApiUrl
    * json RequestAndParams = read('../Resources/AmadeusApi.json')

  @AmadeusApiTest
    @Ok
    Scenario: Correct Status Code
    * def RequestData = RequestAndParams.GetAirports
    Given path RequestData.Endpoint
    When method get
    Then status 200


    @AmadeusApiTest
    @Ok
    Scenario: Correct Content Type
    * def RequestData = RequestAndParams.GetAirports
    Given path RequestData.Endpoint
    When method get
    * print responseHeaders['Content-Type']
    Then match responseHeaders['Content-Type'] == ['application/json']

  @AmadeusApiTest
  @Ok
  Scenario: Correct Response Body
    * def RequestData = RequestAndParams.GetAirports
    Given path RequestData.Endpoint
    When method Get
    * def ResponseJson = response;
    * def ResponseData = ResponseJson.data
    Then match each ResponseData == { id: '#number', from: '#string', to: '#string', date: '#string' }


  @AmadeusApiTest
  @Ok
  Scenario: Correct Response Body (Array)
    * def RequestData = RequestAndParams.GetAirports
    Given path RequestData.Endpoint
    When method Get
    * def ResponseJson = response;
    * def ResponseData = ResponseJson.data
    Then match ResponseJson contains { data: '#array' }
