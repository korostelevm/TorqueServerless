serverless torque pro data logger
- lambda api
- cloudfront frontend
- listens to requests from torque pro app
- obd data in dynamodb




```


eml=&id=0f607264fc6318a92b9e13c65db7cd3c&kff1001=0.0&kff1005=-75.11684333&kff1006=40.06796381&kff1007=0.0&kff1010=18.62078857421875&kff1204=4.7170434&kff1220=0.0058844895&kff1221=-0.22647662&kff1222=1.2626405&kff1223=0.3818174&kff1239=12.873063&kff123a=8.0&kff123b=0.0&kff1266=0.0&kff1267=0.0&kff1270=1026.548&kff129a=11.0&session=1617454617986&time=1617454731910&v=8
```






```js
{
  resource: '/api/{proxy+}',
  path: '/api/obd',
  httpMethod: 'GET',
  headers: {
    'CloudFront-Forwarded-Proto': 'https',
    'CloudFront-Is-Desktop-Viewer': 'true',
    'CloudFront-Is-Mobile-Viewer': 'false',
    'CloudFront-Is-SmartTV-Viewer': 'false',
    'CloudFront-Is-Tablet-Viewer': 'false',
    'CloudFront-Viewer-Country': 'US',
    Host: '3inr7krse7.execute-api.us-east-1.amazonaws.com',
    'User-Agent': 'Amazon CloudFront',
    Via: '1.0 29cb8c298da4d2ced72495e99456ecc8.cloudfront.net (CloudFront), 1.1 cf426d8f6e10e609055662f292295435.cloudfront.net (CloudFront)',
    'X-Amz-Cf-Id': 'chzsOy9-k9NfWfUdATtewMHdZBJgbk1lsAlEPzo5xE2HPa2shPGxtg==',
    'X-Amzn-Trace-Id': 'Root=1-6068668d-0bd28ad36327f3791a29281a',
    'X-Forwarded-For': '173.49.243.128, 130.176.17.146, 130.176.17.95',
    'X-Forwarded-Port': '443',
    'X-Forwarded-Proto': 'https'
  },
  multiValueHeaders: {
    'CloudFront-Forwarded-Proto': [ 'https' ],
    'CloudFront-Is-Desktop-Viewer': [ 'true' ],
    'CloudFront-Is-Mobile-Viewer': [ 'false' ],
    'CloudFront-Is-SmartTV-Viewer': [ 'false' ],
    'CloudFront-Is-Tablet-Viewer': [ 'false' ],
    'CloudFront-Viewer-Country': [ 'US' ],
    Host: [ '3inr7krse7.execute-api.us-east-1.amazonaws.com' ],
    'User-Agent': [ 'Amazon CloudFront' ],
    Via: [
      '1.0 29cb8c298da4d2ced72495e99456ecc8.cloudfront.net (CloudFront), 1.1 cf426d8f6e10e609055662f292295435.cloudfront.net (CloudFront)'
    ],
    'X-Amz-Cf-Id': [ 'chzsOy9-k9NfWfUdATtewMHdZBJgbk1lsAlEPzo5xE2HPa2shPGxtg==' ],
    'X-Amzn-Trace-Id': [ 'Root=1-6068668d-0bd28ad36327f3791a29281a' ],
    'X-Forwarded-For': [ '173.49.243.128, 130.176.17.146, 130.176.17.95' ],
    'X-Forwarded-Port': [ '443' ],
    'X-Forwarded-Proto': [ 'https' ]
  },
  queryStringParameters: {
    eml: '',
    id: '0f607264fc6318a92b9e13c65db7cd3c',
    kff1001: '0.0',
    kff1005: '-75.11684333',
    kff1006: '40.06796381',
    kff1007: '0.0',
    kff1010: '18.62078857421875',
    kff1204: '4.7170434',
    kff1220: '0.0058844895',
    kff1221: '-0.22647662',
    kff1222: '1.2626405',
    kff1223: '0.3818174',
    kff1239: '12.873063',
    kff123a: '8.0',
    kff123b: '0.0',
    kff1266: '0.0',
    kff1267: '0.0',
    kff1270: '1026.548',
    kff129a: '11.0',
    session: '1617454617986',
    time: '1617454731910',
    v: '8'
  },
  multiValueQueryStringParameters: {
    eml: [ '' ],
    id: [ '0f607264fc6318a92b9e13c65db7cd3c' ],
    kff1001: [ '0.0', '0.0' ],
    kff1005: [ '-75.11684333', '-75.11684333' ],
    kff1006: [ '40.06796381', '40.06796381' ],
    kff1007: [ '0.0' ],
    kff1010: [ '18.62078857421875' ],
    kff1204: [ '4.7170434' ],
    kff1220: [ '0.0058844895' ],
    kff1221: [ '-0.22647662' ],
    kff1222: [ '1.2626405' ],
    kff1223: [ '0.3818174' ],
    kff1239: [ '12.873063' ],
    kff123a: [ '8.0' ],
    kff123b: [ '0.0' ],
    kff1266: [ '0.0' ],
    kff1267: [ '0.0' ],
    kff1270: [ '1026.548' ],
    kff129a: [ '11.0' ],
    session: [ '1617454617986' ],
    time: [ '1617454731910' ],
    v: [ '8' ]
  },
  pathParameters: { proxy: 'obd' },
  stageVariables: {
    ServiceApiFunction: 'TorqueServerless-ServiceApiFunction-L26JQMLO27J5'
  },
  requestContext: {
    resourceId: 'ggbj0s',
    resourcePath: '/api/{proxy+}',
    httpMethod: 'GET',
    extendedRequestId: 'dNT2DH6LIAMFSFQ=',
    requestTime: '03/Apr/2021:12:58:53 +0000',
    path: '/Prod/api/obd',
    accountId: '173028852725',
    protocol: 'HTTP/1.1',
    stage: 'Prod',
    domainPrefix: '3inr7krse7',
    requestTimeEpoch: 1617454733002,
    requestId: 'a063129c-cfe2-48db-9655-f18566d5190b',
    identity: {
      cognitoIdentityPoolId: null,
      accountId: null,
      cognitoIdentityId: null,
      caller: null,
      sourceIp: '130.176.17.146',
      principalOrgId: null,
      accessKey: null,
      cognitoAuthenticationType: null,
      cognitoAuthenticationProvider: null,
      userArn: null,
      userAgent: 'Amazon CloudFront',
      user: null
    },
    domainName: '3inr7krse7.execute-api.us-east-1.amazonaws.com',
    apiId: '3inr7krse7'
  },
  body: null,
  isBase64Encoded: false
}

```