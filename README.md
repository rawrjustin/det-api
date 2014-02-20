# API for det
____________________

## Endpoints

All endpoints accept and return JSON

### Login

####_POST_ `/api/login`

Logs in (or signs up if user is new) the user and passes back the user object Pass in a JSON object with key `authToken` and the access token provided by facebookSDK login

Parameters:

    {"authToken":"CAABpBBdQZCT8BAK77qTxj9HQfj6f1xagQ5yGzftVZAzMsMGbGnRSRBNZAvg9wjL9z6NZCImLLlwDgdh2V4eSDLEgaGBSZAZBzF7jVfUk1lTC8vjoJClJP1e985u0jq708ZB4bEyjlZBy6blovedpzSlLsYSMnhvq0rBQxglWbP62iHcYe74ITY89u4RjRANkOnuaYxeHsu5ZBZBaZB93eeljCV0Tp28glnj74EZD"}

Response:

    {"id":2,
    "name":"Justin Huang",
    "facebook_id":"1141801215",
    "email":"justingotemail@gmail.com",
    "token":null,
    "created_at":"2014-02-20T18:14:54.000Z",
    "updated_at":"2014-02-20T18:14:54.000Z"}


####_POST_ `/api/transaction`

Creates a new transaction

Parameters:

    {"debtors": [ 
        { "name" : "allen",
          "facebook_id" : "571815533",
          "amount" : "9282"
        },
        { "name" : "brian",
          "facebook_id" : "100000189248862",
          "amount" : "130"
        }],
      "transaction" : { "description" : "OMG RAILS API BITCHES"},
      "creditor": "1141801215"
    }

Response:

    { "transaction": 
        { "id":5,
          "description":"OMG RAILS API BITCHES",
          "created_at":"2014-02-20T21:17:03.406Z",
          "updated_at":"2014-02-20T21:17:03.406Z"
        },
      "debts":[
        { "id":6,
          "amount":"9282.0",
          "creditor":"1141801215",
          "debtor":"571815533",
          "created_at":"2014-02-20T21:17:03.443Z",
          "updated_at":"2014-02-20T21:17:03.443Z",
          "transaction_id":5},
        { "id":7,
          "amount":"130.0",
          "creditor":"1141801215",
          "debtor":"100000189248862",
          "created_at":"2014-02-20T21:17:03.449Z",
          "updated_at":"2014-02-20T21:17:03.449Z",
          "transaction_id":5}]
    }


####_GET_ `/api/debts?facebook_id=XXXXXX`

Response:

    [
      { "id":1,
        "amount":"9282.0",
        "creditor":"1141801215",
        "debtor":"571815533",
        "created_at":"2014-02-20T20:47:23.000Z",
        "updated_at":"2014-02-20T20:47:23.000Z",
        "transaction_id":2},
      { "id":2,
        "amount":"130.0",
        "creditor":"1141801215",
        "debtor":"100000189248862",
        "created_at":"2014-02-20T20:47:23.000Z",
        "updated_at":"2014-02-20T20:47:23.000Z",
        "transaction_id":2},
      { "id":3,
        "amount":"9282.0",
        "creditor":"1141801215",
        "debtor":"571815533",
        "created_at":"2014-02-20T21:16:06.000Z",
        "updated_at":"2014-02-20T21:16:06.000Z",
        "transaction_id":3},
      { "id":4,
        "amount":"130.0",
        "creditor":"1141801215",
        "debtor":"100000189248862",
        "created_at":"2014-02-20T21:16:06.000Z",
        "updated_at":"2014-02-20T21:16:06.000Z",
        "transaction_id":3}
    ]
