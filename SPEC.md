# Ably REST Client Library 1.0.6 Specification

### Ably::Rest::Client#time
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/time_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/time_spec.rb))_
  * using JSON protocol
    * fetching the service time
      * [should return the service time as a Time object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/time_spec.rb#L10)
      * with reconfigured HTTP timeout
        * [should raise a timeout exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/time_spec.rb#L19)
  * using MsgPack protocol
    * fetching the service time
      * [should return the service time as a Time object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/time_spec.rb#L10)
      * with reconfigured HTTP timeout
        * [should raise a timeout exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/time_spec.rb#L19)

### Ably::Rest::Client
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/client_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb))_
  * using JSON protocol
    * #initialize
      * with only an API key
        * [uses basic authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L25)
      * with an explicit string :token
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L33)
      * with :use_token_auth set to true
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L41)
      * with a :client_id configured
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L49)
      * with a non string :client_id
        * [raises an ArgumentError](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L57)
      * with an invalid wildcard "*" :client_id
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L63)
      * with an :auth_callback lambda
        * [calls the auth lambda to get a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L71)
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L76)
      * with :default_token_params
        * [overides the default token params (#TO3j11)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L90)
      * with an :auth_callback lambda (clientId provided in library options instead of as a token_request param)
        * [correctly sets the clientId on the token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L100)
      * with an auth URL
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L110)
        * before any REST request
          * [sends an HTTP request to the provided auth URL to get a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L121)
      * auth headers
        * with basic auth
          * [sends the API key in authentication part of the secure URL (the Authorization: Basic header is not used with the Faraday HTTP library by default)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L141)
        * with token auth
          * without specifying protocol
            * [sends the token string over HTTPS in the Authorization Bearer header with Base64 encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L160)
          * when setting constructor ClientOption :tls to false
            * [sends the token string over HTTP in the Authorization Bearer header with Base64 encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L170)
    * using tokens
      * when expired
        * [creates a new token automatically when the old token expires](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L203)
        * with a different client_id in the subsequent token
          * [fails to authenticate and raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L216)
      * when token has not expired
        * [reuses the existing token for every request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L227)
    * connection transport
      * defaults
        * for default host
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L244)
          * [is configured to timeout connection requests in 10 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L248)
        * for the fallback hosts
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L254)
          * [is configured to timeout connection requests in 10 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L258)
      * with custom http_open_timeout and http_request_timeout options
        * for default host
          * [is configured to use custom open timeout](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L270)
          * [is configured to use custom request timeout](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L274)
        * for the fallback hosts
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L280)
          * [is configured to timeout connection requests in 10 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L284)
    * fallback hosts
      * configured
        * [should make connection attempts to A.ably-realtime.com, B.ably-realtime.com, C.ably-realtime.com, D.ably-realtime.com, E.ably-realtime.com (#RSC15a)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L298)
      * when environment is NOT production (#RSC15b)
        * [does not retry failed requests with fallback hosts when there is a connection error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L315)
      * when environment is production
        * and connection times out
          * [tries fallback hosts 3 times (#RSC15b, #RSC15b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L354)
          * and the total request time exeeds 15 seconds
            * [makes no further attempts to any fallback hosts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L369)
        * and connection fails
          * [tries fallback hosts 3 times](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L385)
        * and first request to primary endpoint fails
          * [tries a fallback host, and for the next request tries the primary endpoint again (#RSC15e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L419)
        * and basic authentication fails
          * [does not attempt the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L446)
        * and server returns a 50x error
          * [attempts the fallback hosts as this is an authentication failure (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L468)
      * when environment is production and server returns a 50x error
        * with custom fallback hosts provided
          * [attempts the fallback hosts as this is an authentication failure (#RSC15b, #RSC15a, #TO3k6)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L517)
        * with an empty array of fallback hosts provided (#RSC15b, #RSC15a, #TO3k6)
          * [does not attempt the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L530)
        * using a local web-server
          * and timing out the primary host
            * POST with request timeout less than max_retry_duration
              * [tries the primary host, then both fallback hosts (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L594)
            * GET with request timeout less than max_retry_duration
              * [tries the primary host, then both fallback hosts (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L617)
            * POST with request timeout more than max_retry_duration
              * [does not try any fallback hosts (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L640)
            * GET with request timeout more than max_retry_duration
              * [does not try any fallback hosts (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L662)
          * and failing the primary host
            * [tries one of the fallback hosts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L707)
      * when environment is not production and server returns a 50x error
        * with custom fallback hosts provided (#RSC15b, #TO3k6)
          * [attempts the fallback hosts as this is not an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L757)
        * with an empty array of fallback hosts provided (#RSC15b, #TO3k6)
          * [does not attempt the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L770)
        * with fallback_hosts_use_default: true (#RSC15b, #TO3k7)
          * [attempts the default fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L795)
    * with a custom host
      * that does not exist
        * [fails immediately and raises a Faraday Error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L811)
        * fallback hosts
          * [are never used](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L832)
      * that times out
        * [fails immediately and raises a Faraday Error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L847)
        * fallback hosts
          * [are never used](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L860)
    * HTTP configuration options
      * [is frozen](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L917)
      * defaults
        * [#http_open_timeout is 4s](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L872)
        * [#http_request_timeout is 10s](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L876)
        * [#http_max_retry_count is 3](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L880)
        * [#http_max_retry_duration is 15s](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L884)
      * configured
        * [#http_open_timeout uses provided value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L900)
        * [#http_request_timeout uses provided value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L904)
        * [#http_max_retry_count uses provided value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L908)
        * [#http_max_retry_duration uses provided value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L912)
    * #auth
      * [is provides access to the Auth object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L928)
      * [configures the Auth object with all ClientOptions passed to client in the initializer](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L932)
    * version headers
      * with variant none
        * [sends a protocol version and lib version header (#G4, #RSC7a, #RSC7b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L966)
      * with variant foo
        * [sends a protocol version and lib version header (#G4, #RSC7a, #RSC7b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L966)
    * #request (#RSC19*)
      * get
        * [returns an HttpPaginatedResponse object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L979)
        * 404 request to invalid URL
          * [returns an object with 404 status code and error message](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L986)
        * paged results
          * [provides paging](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L998)
    * request_id generation
      * Timeout error
        * with option add_request_ids: true
          * FAILED: ~~[has an error with the same request_id of the request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1033)~~
        * with option add_request_ids: true and REST operations with a message body
          * with mocks to inspect the params
            * with a single publish
              * [succeeds and sends the request_id as a param](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1055)
            * with an array publish
              * [succeeds and sends the request_id as a param](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1062)
          * without mocks to ensure the requests are accepted
            * with a single publish
              * [succeeds and sends the request_id as a param](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1071)
            * with an array publish
              * [succeeds and sends the request_id as a param](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1078)
        * option add_request_ids: true and specified fallback hosts
          * [request_id is the same across retries](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1103)
        * without request_id
          * [does not include request_id in ConnectionTimeout error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1115)
      * UnauthorizedRequest nonce error
        * [includes request_id in UnauthorizedRequest error due to replayed nonce](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1128)
    * failed request logging
      * FAILED: ~~[is absent when requests do not fail](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1145)~~
      * with the first request failing
        * FAILED: ~~[is present with success message when requests do not actually fail](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1159)~~
      * with all requests failing
        * FAILED: ~~[is present when all requests fail](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1175)~~
  * using MsgPack protocol
    * #initialize
      * with only an API key
        * [uses basic authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L25)
      * with an explicit string :token
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L33)
      * with :use_token_auth set to true
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L41)
      * with a :client_id configured
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L49)
      * with a non string :client_id
        * [raises an ArgumentError](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L57)
      * with an invalid wildcard "*" :client_id
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L63)
      * with an :auth_callback lambda
        * [calls the auth lambda to get a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L71)
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L76)
      * with :default_token_params
        * [overides the default token params (#TO3j11)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L90)
      * with an :auth_callback lambda (clientId provided in library options instead of as a token_request param)
        * [correctly sets the clientId on the token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L100)
      * with an auth URL
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L110)
        * before any REST request
          * [sends an HTTP request to the provided auth URL to get a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L121)
      * auth headers
        * with basic auth
          * [sends the API key in authentication part of the secure URL (the Authorization: Basic header is not used with the Faraday HTTP library by default)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L141)
        * with token auth
          * without specifying protocol
            * [sends the token string over HTTPS in the Authorization Bearer header with Base64 encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L160)
          * when setting constructor ClientOption :tls to false
            * [sends the token string over HTTP in the Authorization Bearer header with Base64 encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L170)
    * using tokens
      * when expired
        * [creates a new token automatically when the old token expires](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L203)
        * with a different client_id in the subsequent token
          * [fails to authenticate and raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L216)
      * when token has not expired
        * [reuses the existing token for every request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L227)
    * connection transport
      * defaults
        * for default host
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L244)
          * [is configured to timeout connection requests in 10 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L248)
        * for the fallback hosts
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L254)
          * [is configured to timeout connection requests in 10 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L258)
      * with custom http_open_timeout and http_request_timeout options
        * for default host
          * [is configured to use custom open timeout](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L270)
          * [is configured to use custom request timeout](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L274)
        * for the fallback hosts
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L280)
          * [is configured to timeout connection requests in 10 seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L284)
    * fallback hosts
      * configured
        * [should make connection attempts to A.ably-realtime.com, B.ably-realtime.com, C.ably-realtime.com, D.ably-realtime.com, E.ably-realtime.com (#RSC15a)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L298)
      * when environment is NOT production (#RSC15b)
        * [does not retry failed requests with fallback hosts when there is a connection error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L315)
      * when environment is production
        * and connection times out
          * [tries fallback hosts 3 times (#RSC15b, #RSC15b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L354)
          * and the total request time exeeds 15 seconds
            * [makes no further attempts to any fallback hosts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L369)
        * and connection fails
          * [tries fallback hosts 3 times](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L385)
        * and first request to primary endpoint fails
          * [tries a fallback host, and for the next request tries the primary endpoint again (#RSC15e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L419)
        * and basic authentication fails
          * [does not attempt the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L446)
        * and server returns a 50x error
          * [attempts the fallback hosts as this is an authentication failure (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L468)
      * when environment is production and server returns a 50x error
        * with custom fallback hosts provided
          * [attempts the fallback hosts as this is an authentication failure (#RSC15b, #RSC15a, #TO3k6)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L517)
        * with an empty array of fallback hosts provided (#RSC15b, #RSC15a, #TO3k6)
          * [does not attempt the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L530)
        * using a local web-server
          * and timing out the primary host
            * POST with request timeout less than max_retry_duration
              * [tries the primary host, then both fallback hosts (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L594)
            * GET with request timeout less than max_retry_duration
              * [tries the primary host, then both fallback hosts (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L617)
            * POST with request timeout more than max_retry_duration
              * [does not try any fallback hosts (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L640)
            * GET with request timeout more than max_retry_duration
              * [does not try any fallback hosts (#RSC15d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L662)
          * and failing the primary host
            * [tries one of the fallback hosts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L707)
      * when environment is not production and server returns a 50x error
        * with custom fallback hosts provided (#RSC15b, #TO3k6)
          * [attempts the fallback hosts as this is not an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L757)
        * with an empty array of fallback hosts provided (#RSC15b, #TO3k6)
          * [does not attempt the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L770)
        * with fallback_hosts_use_default: true (#RSC15b, #TO3k7)
          * [attempts the default fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L795)
    * with a custom host
      * that does not exist
        * [fails immediately and raises a Faraday Error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L811)
        * fallback hosts
          * [are never used](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L832)
      * that times out
        * [fails immediately and raises a Faraday Error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L847)
        * fallback hosts
          * [are never used](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L860)
    * HTTP configuration options
      * [is frozen](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L917)
      * defaults
        * [#http_open_timeout is 4s](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L872)
        * [#http_request_timeout is 10s](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L876)
        * [#http_max_retry_count is 3](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L880)
        * [#http_max_retry_duration is 15s](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L884)
      * configured
        * [#http_open_timeout uses provided value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L900)
        * [#http_request_timeout uses provided value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L904)
        * [#http_max_retry_count uses provided value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L908)
        * [#http_max_retry_duration uses provided value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L912)
    * #auth
      * [is provides access to the Auth object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L928)
      * [configures the Auth object with all ClientOptions passed to client in the initializer](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L932)
    * version headers
      * with variant none
        * [sends a protocol version and lib version header (#G4, #RSC7a, #RSC7b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L966)
      * with variant foo
        * [sends a protocol version and lib version header (#G4, #RSC7a, #RSC7b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L966)
    * #request (#RSC19*)
      * get
        * [returns an HttpPaginatedResponse object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L979)
        * 404 request to invalid URL
          * [returns an object with 404 status code and error message](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L986)
        * paged results
          * [provides paging](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L998)
    * request_id generation
      * Timeout error
        * with option add_request_ids: true
          * FAILED: ~~[has an error with the same request_id of the request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1033)~~
        * with option add_request_ids: true and REST operations with a message body
          * with mocks to inspect the params
            * with a single publish
              * [succeeds and sends the request_id as a param](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1055)
            * with an array publish
              * [succeeds and sends the request_id as a param](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1062)
          * without mocks to ensure the requests are accepted
            * with a single publish
              * [succeeds and sends the request_id as a param](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1071)
            * with an array publish
              * [succeeds and sends the request_id as a param](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1078)
        * option add_request_ids: true and specified fallback hosts
          * [request_id is the same across retries](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1103)
        * without request_id
          * [does not include request_id in ConnectionTimeout error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1115)
      * UnauthorizedRequest nonce error
        * [includes request_id in UnauthorizedRequest error due to replayed nonce](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1128)
    * failed request logging
      * FAILED: ~~[is absent when requests do not fail](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1145)~~
      * with the first request failing
        * FAILED: ~~[is present with success message when requests do not actually fail](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1159)~~
      * with all requests failing
        * FAILED: ~~[is present when all requests fail](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/client_spec.rb#L1175)~~

### Ably::Rest::Client#stats
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/stats_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb))_
  * using JSON protocol
    * fetching application stats
      * [returns a PaginatedResult object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L54)
      * by minute
        * with no options
          * [uses the minute interval by default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L66)
        * with :from set to last interval and :limit set to 1
          * [retrieves only one stat](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L75)
          * [returns zero value for any missing metrics](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L79)
          * [returns all aggregated message data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L84)
          * [returns inbound realtime all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L89)
          * [returns inbound realtime message data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L94)
          * [returns outbound realtime all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L99)
          * [returns persisted presence all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L104)
          * [returns connections all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L109)
          * [returns channels all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L114)
          * [returns api_requests data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L119)
          * [returns token_requests data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L124)
          * [returns stat objects with #interval_granularity equal to :minute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L129)
          * [returns stat objects with #interval_id matching :start](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L133)
          * [returns stat objects with #interval_time matching :start Time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L137)
        * with :start set to first interval, :limit set to 1 and direction :forwards
          * [returns the first interval stats as stats are provided forwards from :start](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L147)
          * [returns 3 pages of stats](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L151)
        * with :end set to last interval, :limit set to 1 and direction :backwards
          * [returns the 3rd interval stats first as stats are provided backwards from :end](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L163)
          * [returns 3 pages of stats](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L167)
        * with :end set to last interval and :limit set to 3 to ensure only last years stats are included
          * the REST API
            * [defaults to direction :backwards](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L179)
        * with :end set to previous year interval
          * the REST API
            * [defaults to 100 items for pagination](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L191)
      * by hour
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L215)
      * by day
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L215)
      * by month
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L215)
      * when argument start is after end
        * [should raise an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L227)
  * using MsgPack protocol
    * fetching application stats
      * [returns a PaginatedResult object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L54)
      * by minute
        * with no options
          * [uses the minute interval by default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L66)
        * with :from set to last interval and :limit set to 1
          * [retrieves only one stat](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L75)
          * [returns zero value for any missing metrics](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L79)
          * [returns all aggregated message data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L84)
          * [returns inbound realtime all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L89)
          * [returns inbound realtime message data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L94)
          * [returns outbound realtime all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L99)
          * [returns persisted presence all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L104)
          * [returns connections all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L109)
          * [returns channels all data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L114)
          * [returns api_requests data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L119)
          * [returns token_requests data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L124)
          * [returns stat objects with #interval_granularity equal to :minute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L129)
          * [returns stat objects with #interval_id matching :start](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L133)
          * [returns stat objects with #interval_time matching :start Time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L137)
        * with :start set to first interval, :limit set to 1 and direction :forwards
          * [returns the first interval stats as stats are provided forwards from :start](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L147)
          * [returns 3 pages of stats](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L151)
        * with :end set to last interval, :limit set to 1 and direction :backwards
          * [returns the 3rd interval stats first as stats are provided backwards from :end](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L163)
          * [returns 3 pages of stats](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L167)
        * with :end set to last interval and :limit set to 3 to ensure only last years stats are included
          * the REST API
            * [defaults to direction :backwards](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L179)
        * with :end set to previous year interval
          * the REST API
            * [defaults to 100 items for pagination](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L191)
      * by hour
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L215)
      * by day
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L215)
      * by month
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L215)
      * when argument start is after end
        * [should raise an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/stats_spec.rb#L227)

### Ably::Rest::Presence
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/presence_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb))_
  * using JSON protocol
    * tested against presence fixture data set up in test app
      * #get
        * [returns current members on the channel with their action set to :present](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L41)
        * with :limit option
          * [returns a paged response limiting number of members per page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L57)
        * default :limit
          * [defaults to a limit of 100](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L86)
        * with :client_id option
          * [returns a list members filtered by the provided client ID](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L95)
        * with :connection_id option
          * [returns a list members filtered by the provided connection ID](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L106)
          * [returns a list members filtered by the provided connection ID](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L110)
        * with a non ASCII channel name
          * stubbed
            * [correctly encodes the channel name](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L127)
      * #history
        * [returns recent presence activity](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L138)
        * default behaviour
          * [uses backwards direction](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L153)
        * with options
          * direction: :forwards
            * [returns recent presence activity forwards with most recent history last](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L165)
          * direction: :backwards
            * [returns recent presence activity backwards with most recent history first](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L180)
    * #history
      * with options
        * limit options
          * default
            * [is set to 100](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L225)
          * set to 1000
            * [is passes the limit query param value 1000](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L238)
        * with time range options
          * :start
            * with milliseconds since epoch value
              * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L268)
            * with Time object value
              * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L278)
          * :end
            * with milliseconds since epoch value
              * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L268)
            * with Time object value
              * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L278)
          * when argument start is after end
            * [should raise an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L289)
    * decoding
      * with encoded fixture data
        * #history
          * [decodes encoded and encryped presence fixture data automatically](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L308)
        * #get
          * [decodes encoded and encryped presence fixture data automatically](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L315)
    * decoding permutations using mocked #history
      * valid decodeable content
        * #get
          * [automaticaly decodes presence messages](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L368)
        * #history
          * [automaticaly decodes presence messages](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L385)
      * invalid data
        * #get
          * [returns the messages still encoded](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L416)
          * [logs a cipher error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L420)
        * #history
          * [returns the messages still encoded](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L440)
          * [logs a cipher error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L444)
  * using MsgPack protocol
    * tested against presence fixture data set up in test app
      * #get
        * [returns current members on the channel with their action set to :present](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L41)
        * with :limit option
          * [returns a paged response limiting number of members per page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L57)
        * default :limit
          * [defaults to a limit of 100](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L86)
        * with :client_id option
          * [returns a list members filtered by the provided client ID](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L95)
        * with :connection_id option
          * [returns a list members filtered by the provided connection ID](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L106)
          * [returns a list members filtered by the provided connection ID](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L110)
        * with a non ASCII channel name
          * stubbed
            * [correctly encodes the channel name](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L127)
      * #history
        * [returns recent presence activity](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L138)
        * default behaviour
          * [uses backwards direction](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L153)
        * with options
          * direction: :forwards
            * [returns recent presence activity forwards with most recent history last](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L165)
          * direction: :backwards
            * [returns recent presence activity backwards with most recent history first](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L180)
    * #history
      * with options
        * limit options
          * default
            * [is set to 100](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L225)
          * set to 1000
            * [is passes the limit query param value 1000](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L238)
        * with time range options
          * :start
            * with milliseconds since epoch value
              * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L268)
            * with Time object value
              * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L278)
          * :end
            * with milliseconds since epoch value
              * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L268)
            * with Time object value
              * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L278)
          * when argument start is after end
            * [should raise an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L289)
    * decoding
      * with encoded fixture data
        * #history
          * [decodes encoded and encryped presence fixture data automatically](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L308)
        * #get
          * [decodes encoded and encryped presence fixture data automatically](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L315)
    * decoding permutations using mocked #history
      * valid decodeable content
        * #get
          * [automaticaly decodes presence messages](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L368)
        * #history
          * [automaticaly decodes presence messages](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L385)
      * invalid data
        * #get
          * [returns the messages still encoded](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L416)
          * [logs a cipher error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L420)
        * #history
          * [returns the messages still encoded](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L440)
          * [logs a cipher error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/presence_spec.rb#L444)

### Ably::Rest::Channels
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/channels_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb))_
  * using JSON protocol
    * using shortcut method #channel on the client object
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L11)
    * using #get method on client#channels
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L11)
    * accessing an existing channel object with different options
      * [overrides the existing channel options and returns the channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L39)
    * accessing an existing channel object without specifying any channel options
      * [returns the existing channel without modifying the channel options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L50)
    * using undocumented array accessor [] method on client#channels
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L11)
  * using MsgPack protocol
    * using shortcut method #channel on the client object
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L11)
    * using #get method on client#channels
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L11)
    * accessing an existing channel object with different options
      * [overrides the existing channel options and returns the channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L39)
    * accessing an existing channel object without specifying any channel options
      * [returns the existing channel without modifying the channel options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L50)
    * using undocumented array accessor [] method on client#channels
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channels_spec.rb#L11)

### Ably::Rest::Channel messages
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/message_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb))_
  * using JSON protocol
    * publishing with an ASCII_8BIT message name
      * [is converted into UTF_8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L18)
    * with supported data payload content type
      * JSON Object (Hash)
        * [is encoded and decoded to the same hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L30)
      * JSON Array
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L39)
      * String
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L48)
      * Binary
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L57)
    * with supported extra payload content type (#RSL1h, #RSL6a2)
      * JSON Object (Hash)
        * [is encoded and decoded to the same hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L70)
      * JSON Array
        * [is encoded and decoded to the same deep multi-type object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L80)
      * nil
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L87)
    * with unsupported data payload content type
      * Integer
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L98)
      * Float
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L106)
      * Boolean
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L114)
      * False
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L122)
    * encryption and encoding
      * with #publish and #history
        * with AES-128-CBC using crypto-data-128.json fixtures (#RTL7d)
          * item 0 with encrypted encoding utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 1 with encrypted encoding cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 2 with encrypted encoding json/utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 3 with encrypted encoding json/utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
        * with AES-256-CBC using crypto-data-256.json fixtures (#RTL7d)
          * item 0 with encrypted encoding utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 1 with encrypted encoding cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 2 with encrypted encoding json/utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 3 with encrypted encoding json/utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
        * when publishing lots of messages
          * [encrypts on #publish and decrypts on #history](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L215)
        * when retrieving #history with a different protocol
          * [delivers a String ASCII-8BIT payload to the receiver](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L242)
          * [delivers a String UTF-8 payload to the receiver](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L242)
          * [delivers a Hash payload to the receiver](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L242)
        * when publishing on an unencrypted channel and retrieving with #history on an encrypted channel
          * [does not attempt to decrypt the message](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L258)
        * when publishing on an encrypted channel and retrieving with #history on an unencrypted channel
          * [retrieves the message that remains encrypted with an encrypted encoding attribute (#RTL7e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L279)
          * [logs a Cipher exception (#RTL7e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L285)
        * publishing on an encrypted channel and retrieving #history with a different algorithm on another client (#RTL7e)
          * [retrieves the message that remains encrypted with an encrypted encoding attribute (#RTL7e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L306)
          * [logs a Cipher exception (#RTL7e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L312)
        * publishing on an encrypted channel and subscribing with a different key on another client
          * [retrieves the message that remains encrypted with an encrypted encoding attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L333)
          * [logs a Cipher exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L339)
  * using MsgPack protocol
    * publishing with an ASCII_8BIT message name
      * [is converted into UTF_8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L18)
    * with supported data payload content type
      * JSON Object (Hash)
        * [is encoded and decoded to the same hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L30)
      * JSON Array
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L39)
      * String
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L48)
      * Binary
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L57)
    * with supported extra payload content type (#RSL1h, #RSL6a2)
      * JSON Object (Hash)
        * [is encoded and decoded to the same hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L70)
      * JSON Array
        * [is encoded and decoded to the same deep multi-type object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L80)
      * nil
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L87)
    * with unsupported data payload content type
      * Integer
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L98)
      * Float
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L106)
      * Boolean
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L114)
      * False
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L122)
    * encryption and encoding
      * with #publish and #history
        * with AES-128-CBC using crypto-data-128.json fixtures (#RTL7d)
          * item 0 with encrypted encoding utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 1 with encrypted encoding cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 2 with encrypted encoding json/utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 3 with encrypted encoding json/utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
        * with AES-256-CBC using crypto-data-256.json fixtures (#RTL7d)
          * item 0 with encrypted encoding utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 1 with encrypted encoding cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 2 with encrypted encoding json/utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
          * item 3 with encrypted encoding json/utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L167)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library (#RTL7d)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L182)
        * when publishing lots of messages
          * [encrypts on #publish and decrypts on #history](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L215)
        * when retrieving #history with a different protocol
          * [delivers a String ASCII-8BIT payload to the receiver](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L242)
          * [delivers a String UTF-8 payload to the receiver](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L242)
          * [delivers a Hash payload to the receiver](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L242)
        * when publishing on an unencrypted channel and retrieving with #history on an encrypted channel
          * [does not attempt to decrypt the message](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L258)
        * when publishing on an encrypted channel and retrieving with #history on an unencrypted channel
          * [retrieves the message that remains encrypted with an encrypted encoding attribute (#RTL7e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L279)
          * [logs a Cipher exception (#RTL7e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L285)
        * publishing on an encrypted channel and retrieving #history with a different algorithm on another client (#RTL7e)
          * [retrieves the message that remains encrypted with an encrypted encoding attribute (#RTL7e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L306)
          * [logs a Cipher exception (#RTL7e)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L312)
        * publishing on an encrypted channel and subscribing with a different key on another client
          * [retrieves the message that remains encrypted with an encrypted encoding attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L333)
          * [logs a Cipher exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/message_spec.rb#L339)

### Ably::Models::MessageEncoders
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/encoders_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb))_
  * with binary transport protocol
    * without encryption
      * with UTF-8 data
        * [does not apply any encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L41)
      * with binary data
        * [does not apply any encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L52)
      * with JSON data
        * [stringifies the JSON and sets the encoding attribute to "json"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L63)
    * with encryption
      * with UTF-8 data
        * [applies utf-8 and cipher encoding and sets the encoding attribute to "utf-8/cipher+aes-128-cbc"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L78)
      * with binary data
        * [applies cipher encoding and sets the encoding attribute to "cipher+aes-128-cbc"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L89)
      * with JSON data
        * [applies json, utf-8 and cipher encoding and sets the encoding attribute to "json/utf-8/cipher+aes-128-cbc"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L100)
  * with text transport protocol
    * without encryption
      * with UTF-8 data
        * [does not apply any encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L117)
      * with binary data
        * [applies a base64 encoding and sets the encoding attribute to "base64"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L128)
      * with JSON data
        * [stringifies the JSON and sets the encoding attribute to "json"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L139)
    * with encryption
      * with UTF-8 data
        * [applies utf-8, cipher and base64 encodings and sets the encoding attribute to "utf-8/cipher+aes-128-cbc/base64"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L154)
      * with binary data
        * [applies cipher and base64 encoding and sets the encoding attribute to "cipher+aes-128-cbc/base64"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L165)
      * with JSON data
        * [applies json, utf-8, cipher and base64 encoding and sets the encoding attribute to "json/utf-8/cipher+aes-128-cbc/base64"](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/encoders_spec.rb#L176)

### Ably::Rest::Channel
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/channel_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb))_
  * using JSON protocol
    * #publish
      * with name and data arguments
        * [publishes the message and return true indicating success](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L21)
        * and additional attributes
          * [publishes the message with the attributes and return true indicating success](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L30)
      * with a client_id configured in the ClientOptions
        * [publishes the message without a client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L41)
        * [expects a client_id to be added by the realtime service](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L49)
      * with an array of Hash objects with :name and :data attributes
        * [publishes an array of messages in one HTTP request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L62)
      * with an array of Message objects
        * [publishes an array of messages in one HTTP request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L77)
      * without adequate permissions on the channel
        * [raises a permission error when publishing](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L89)
      * null attributes
        * when name is null
          * [publishes the message without a name attribute in the payload](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L98)
        * when data is null
          * [publishes the message without a data attribute in the payload](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L109)
        * with neither name or data attributes
          * [publishes the message without any attributes in the payload](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L120)
      * identified clients
        * when authenticated with a wildcard client_id
          * with a valid client_id in the message
            * [succeeds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L137)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L146)
          * with an empty client_id in the message
            * [succeeds and publishes without a client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L152)
        * when authenticated with a Token string with an implicit client_id
          * without having a confirmed identity
            * with a valid client_id in the message
              * [succeeds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L169)
            * with an invalid client_id in the message
              * [succeeds in the client library but then fails when published to Ably](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L178)
            * with an empty client_id in the message
              * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L184)
        * when authenticated with TokenDetails with a valid client_id
          * with a valid client_id in the message
            * [succeeds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L201)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L210)
          * with an invalid client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L216)
          * with an empty client_id in the message
            * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L222)
        * when anonymous and no client_id
          * with a client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L238)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L244)
          * with an empty client_id in the message
            * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L250)
      * with a non ASCII channel name
        * stubbed
          * [correctly encodes the channel name](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L272)
    * #history
      * [returns a PaginatedResult model](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L297)
      * [returns the current message history for the channel](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L301)
      * [returns paged history using the PaginatedResult model](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L329)
      * message timestamps
        * [are after the messages were published](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L314)
      * message IDs
        * [is unique](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L322)
      * direction
        * [returns paged history backwards by default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L356)
        * [returns history forward if specified in the options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L362)
      * limit
        * [defaults to 100](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L374)
    * #history option
      * :start
        * with milliseconds since epoch value
          * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L414)
        * with a Time object value
          * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L424)
      * :end
        * with milliseconds since epoch value
          * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L414)
        * with a Time object value
          * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L424)
      * when argument start is after end
        * [should raise an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L434)
    * #presence
      * [returns a REST Presence object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L444)
  * using MsgPack protocol
    * #publish
      * with name and data arguments
        * [publishes the message and return true indicating success](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L21)
        * and additional attributes
          * [publishes the message with the attributes and return true indicating success](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L30)
      * with a client_id configured in the ClientOptions
        * [publishes the message without a client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L41)
        * [expects a client_id to be added by the realtime service](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L49)
      * with an array of Hash objects with :name and :data attributes
        * [publishes an array of messages in one HTTP request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L62)
      * with an array of Message objects
        * [publishes an array of messages in one HTTP request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L77)
      * without adequate permissions on the channel
        * [raises a permission error when publishing](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L89)
      * null attributes
        * when name is null
          * [publishes the message without a name attribute in the payload](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L98)
        * when data is null
          * [publishes the message without a data attribute in the payload](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L109)
        * with neither name or data attributes
          * [publishes the message without any attributes in the payload](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L120)
      * identified clients
        * when authenticated with a wildcard client_id
          * with a valid client_id in the message
            * [succeeds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L137)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L146)
          * with an empty client_id in the message
            * [succeeds and publishes without a client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L152)
        * when authenticated with a Token string with an implicit client_id
          * without having a confirmed identity
            * with a valid client_id in the message
              * [succeeds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L169)
            * with an invalid client_id in the message
              * [succeeds in the client library but then fails when published to Ably](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L178)
            * with an empty client_id in the message
              * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L184)
        * when authenticated with TokenDetails with a valid client_id
          * with a valid client_id in the message
            * [succeeds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L201)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L210)
          * with an invalid client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L216)
          * with an empty client_id in the message
            * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L222)
        * when anonymous and no client_id
          * with a client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L238)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L244)
          * with an empty client_id in the message
            * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L250)
      * with a non ASCII channel name
        * stubbed
          * [correctly encodes the channel name](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L272)
    * #history
      * [returns a PaginatedResult model](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L297)
      * [returns the current message history for the channel](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L301)
      * [returns paged history using the PaginatedResult model](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L329)
      * message timestamps
        * [are after the messages were published](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L314)
      * message IDs
        * [is unique](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L322)
      * direction
        * [returns paged history backwards by default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L356)
        * [returns history forward if specified in the options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L362)
      * limit
        * [defaults to 100](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L374)
    * #history option
      * :start
        * with milliseconds since epoch value
          * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L414)
        * with a Time object value
          * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L424)
      * :end
        * with milliseconds since epoch value
          * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L414)
        * with a Time object value
          * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L424)
      * when argument start is after end
        * [should raise an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L434)
    * #presence
      * [returns a REST Presence object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/channel_spec.rb#L444)

### Ably::Auth
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/auth_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb))_
  * using JSON protocol
    * [has immutable options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L60)
    * #request_token
      * [creates a TokenRequest automatically and sends it to Ably to obtain a token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L75)
      * [returns a valid TokenDetails object in the expected format with valid issued and expires attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L84)
      * with token_param :client_id
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :capability
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :nonce
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :timestamp
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :ttl
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with :key option
        * [key_name is used in request and signing uses key_secret](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L147)
      * with :key_name & :key_secret options
        * [key_name is used in request and signing uses key_secret](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L177)
      * with :query_time option
        * [queries the server for the time (#RSA10k)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L185)
      * without :query_time option
        * [does not query the server for the time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L194)
      * with :auth_url option merging
        * with existing configured auth options
          * using unspecified :auth_method
            * [requests a token using a GET request with provided headers, and merges client_id into auth_params](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L234)
            * with provided token_params
              * [merges provided token_params with existing auth_params and client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L242)
            * with provided auth option auth_params and auth_headers
              * [replaces any preconfigured auth_params](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L250)
          * using :get :auth_method and query params in the URL
            * [requests a token using a GET request with provided headers, and merges client_id into auth_params and existing URL querystring into new URL querystring](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L261)
          * using :post :auth_method
            * [requests a token using a POST request with provided headers, and merges client_id into auth_params as form-encoded post data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L271)
      * with :auth_url option
        * when response from :auth_url is a valid token request
          * [requests a token from :auth_url using an HTTP GET request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L321)
          * [returns a valid token generated from the token request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L326)
          * with :query_params
            * [requests a token from :auth_url with the :query_params](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L333)
          * with :headers
            * [requests a token from :auth_url with the HTTP headers set](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L341)
          * with POST
            * [requests a token from :auth_url using an HTTP POST instead of the default GET](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L349)
        * when response from :auth_url is a token details object
          * [returns TokenDetails created from the token JSON](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L374)
        * when response from :auth_url is text/plain content type and a token string
          * [returns TokenDetails created from the token JSON](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L392)
        * when response is invalid
          * 500
            * [raises ServerError](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L406)
          * XML
            * [raises InvalidResponseBody](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L417)
      * with a Proc for the :auth_callback option
        * that returns a TokenRequest
          * [calls the Proc with token_params when authenticating to obtain the request token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L440)
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L444)
          * when authorized
            * [sets Auth#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L451)
            * [sets Client#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L455)
        * that returns a TokenDetails JSON object
          * [calls the lambda when authenticating to obtain the request token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L489)
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L494)
          * when authorized
            * [sets Auth#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L506)
            * [sets Client#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L510)
        * that returns a TokenDetails object
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L525)
        * that returns a Token string
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L541)
      * with auth_option :client_id
        * [returns a token with the client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L571)
      * with token_param :client_id
        * [returns a token with the client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L580)
    * before #authorize has been called
      * [has no current_token_details](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L587)
    * #authorize (#RSA10, #RSA10j)
      * [updates the persisted token params that are then used for subsequent authorize requests](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L754)
      * [updates the persisted auth options that are then used for subsequent authorize requests](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L760)
      * when called for the first time since the client has been instantiated
        * [passes all auth_options and token_params to #request_token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L601)
        * [returns a valid token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L606)
        * [issues a new token every time (#RSA10a)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L610)
      * query_time: true with authorize
        * [only queries the server time once and then works out the offset, query_time option is never persisted (#RSA10k)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L624)
      * query_time: true ClientOption when instanced
        * [only queries the server time once and then works out the offset, query_time option is never persisted (#RSA10k)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L644)
      * TokenParams argument
        * [has no effect on the defaults when null and TokenParam defaults remain the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L661)
        * [updates defaults when present and all previous configured TokenParams are discarded (#RSA10g)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L668)
        * [updates Auth#token_params attribute with an immutable hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L676)
        * [uses TokenParams#timestamp for this request but obtains a new timestamp for subsequence requests (#RSA10g)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L681)
      * AuthOptions argument
        * [has no effect on the defaults when null and AuthOptions defaults remain the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L706)
        * [updates defaults when present and all previous configured AuthOptions are discarded (#RSA10g)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L712)
        * [updates Auth#options attribute with an immutable hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L719)
        * [uses AuthOptions#query_time for this request and will not query_time for subsequent requests (#RSA10g)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L724)
        * [uses AuthOptions#query_time for this request and will query_time again if provided subsequently](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L730)
      * with previous authorisation
        * [requests a new token if token is expired](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L743)
        * [issues a new token every time #authorize is called](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L749)
      * with a lambda for the :auth_callback option
        * [calls the lambda](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L776)
        * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L780)
        * for every subsequent #request_token
          * without a :auth_callback lambda
            * [calls the originally provided block](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L786)
          * with a provided block
            * [does not call the originally provided lambda and calls the new #request_token :auth_callback lambda](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L793)
      * with an explicit token string that expires
        * and a lambda for the :auth_callback option to provide a means to renew the token
          * [calls the lambda once the token has expired and the new token is used](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L820)
      * with an explicit ClientOptions client_id
        * and an incompatible client_id in a TokenDetails object passed to the auth callback
          * [rejects a TokenDetails object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L838)
        * and an incompatible client_id in a TokenRequest object passed to the auth callback and raises an exception
          * [rejects a TokenRequests object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L846)
        * and a token string without any retrievable client_id
          * [rejects a TokenRequests object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L854)
    * #create_token_request
      * [returns a TokenRequest object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L869)
      * [returns a TokenRequest that can be passed to a client that can use it for authentication without an API key](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L873)
      * [uses the key name from the client](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L880)
      * [specifies no TTL (#RSA5)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L884)
      * [specifies no capability (#RSA6)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L898)
      * with a :ttl option below the Token expiry buffer that ensures tokens are renewed 15s before they expire as they are considered expired
        * [uses the Token expiry buffer default + 10s to allow for a token request in flight](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L892)
      * the nonce
        * [is unique for every request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L903)
        * [is at least 16 characters](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L908)
      * with token param :ttl
        * [overrides default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L919)
      * with token param :nonce
        * [overrides default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L919)
      * with token param :client_id
        * [overrides default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L919)
      * when specifying capability
        * [overrides the default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L930)
        * [uses these capabilities when Ably issues an actual token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L934)
      * with additional invalid attributes
        * [are ignored](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L944)
      * when required fields are missing
        * [should raise an exception if key secret is missing](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L955)
        * [should raise an exception if key name is missing](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L959)
      * timestamp attribute
        * [is a Time object in Ruby and is set to the local time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L986)
        * with :query_time auth_option
          * [queries the server for the timestamp](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L971)
        * with :timestamp option
          * [uses the provided timestamp in the token request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L981)
      * signing
        * [generates a valid HMAC](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1010)
        * lexicographic ordering of channels and operations
          * [HMAC is lexicographic ordered and thus the HMAC is identical](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1037)
          * [is valid when used for authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1043)
    * using token authentication
      * with :token option
        * [authenticates successfully using the provided :token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1070)
        * [disallows publishing on unspecified capability channels](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1074)
        * [fails if timestamp is invalid](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1082)
        * [cannot be renewed automatically](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1090)
        * and the token expires
          * [should indicate an error and not retry the request (#RSA4a)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1124)
      * when implicit as a result of using :client_id
        * and requests to the Ably server are mocked
          * [will send a token request to the server](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1154)
        * a token is created
          * [before a request is made](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1163)
          * [when a message is published](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1167)
          * [with capability and TTL defaults (#TK2a, #TK2b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1171)
          * [#client_id contains the client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1182)
      * when token expires
        * [automatically renews the token (#RSA4b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1211)
        * [fails if the token renewal fails (#RSA4b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1221)
      * when :client_id is provided in a token
        * [#client_id contains the client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1245)
    * #client_id_validated?
      * when using basic auth
        * [is false as basic auth users do not have an identity](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1257)
      * when using a token auth string for a token with a client_id
        * [is false as identification is not possible from an opaque token string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1265)
      * when using a token
        * with a client_id
          * [is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1274)
        * with no client_id (anonymous)
          * [is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1282)
        * with a wildcard client_id (anonymous)
          * [is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1290)
      * when using a token request with a client_id
        * [is not true as identification is not confirmed until authenticated](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1299)
        * after authentication
          * [is true as identification is completed during implicit authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1306)
    * when using a :key and basic auth
      * [#using_token_auth? is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1314)
      * [#key attribute contains the key string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1318)
      * [#using_basic_auth? is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1322)
    * deprecated #authorise
      * FAILED: ~~[logs a deprecation warning (#RSA10l)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1331)~~
      * FAILED: ~~[returns a valid token (#RSA10l)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1336)~~
  * using MsgPack protocol
    * [has immutable options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L60)
    * #request_token
      * [creates a TokenRequest automatically and sends it to Ably to obtain a token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L75)
      * [returns a valid TokenDetails object in the expected format with valid issued and expires attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L84)
      * with token_param :client_id
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :capability
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :nonce
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :timestamp
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :ttl
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L117)
      * with :key option
        * [key_name is used in request and signing uses key_secret](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L147)
      * with :key_name & :key_secret options
        * [key_name is used in request and signing uses key_secret](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L177)
      * with :query_time option
        * [queries the server for the time (#RSA10k)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L185)
      * without :query_time option
        * [does not query the server for the time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L194)
      * with :auth_url option merging
        * with existing configured auth options
          * using unspecified :auth_method
            * [requests a token using a GET request with provided headers, and merges client_id into auth_params](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L234)
            * with provided token_params
              * [merges provided token_params with existing auth_params and client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L242)
            * with provided auth option auth_params and auth_headers
              * [replaces any preconfigured auth_params](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L250)
          * using :get :auth_method and query params in the URL
            * [requests a token using a GET request with provided headers, and merges client_id into auth_params and existing URL querystring into new URL querystring](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L261)
          * using :post :auth_method
            * [requests a token using a POST request with provided headers, and merges client_id into auth_params as form-encoded post data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L271)
      * with :auth_url option
        * when response from :auth_url is a valid token request
          * [requests a token from :auth_url using an HTTP GET request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L321)
          * [returns a valid token generated from the token request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L326)
          * with :query_params
            * [requests a token from :auth_url with the :query_params](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L333)
          * with :headers
            * [requests a token from :auth_url with the HTTP headers set](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L341)
          * with POST
            * [requests a token from :auth_url using an HTTP POST instead of the default GET](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L349)
        * when response from :auth_url is a token details object
          * [returns TokenDetails created from the token JSON](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L374)
        * when response from :auth_url is text/plain content type and a token string
          * [returns TokenDetails created from the token JSON](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L392)
        * when response is invalid
          * 500
            * [raises ServerError](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L406)
          * XML
            * [raises InvalidResponseBody](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L417)
      * with a Proc for the :auth_callback option
        * that returns a TokenRequest
          * [calls the Proc with token_params when authenticating to obtain the request token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L440)
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L444)
          * when authorized
            * [sets Auth#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L451)
            * [sets Client#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L455)
        * that returns a TokenDetails JSON object
          * [calls the lambda when authenticating to obtain the request token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L489)
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L494)
          * when authorized
            * [sets Auth#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L506)
            * [sets Client#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L510)
        * that returns a TokenDetails object
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L525)
        * that returns a Token string
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L541)
      * with auth_option :client_id
        * [returns a token with the client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L571)
      * with token_param :client_id
        * [returns a token with the client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L580)
    * before #authorize has been called
      * [has no current_token_details](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L587)
    * #authorize (#RSA10, #RSA10j)
      * [updates the persisted token params that are then used for subsequent authorize requests](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L754)
      * [updates the persisted auth options that are then used for subsequent authorize requests](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L760)
      * when called for the first time since the client has been instantiated
        * [passes all auth_options and token_params to #request_token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L601)
        * [returns a valid token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L606)
        * [issues a new token every time (#RSA10a)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L610)
      * query_time: true with authorize
        * [only queries the server time once and then works out the offset, query_time option is never persisted (#RSA10k)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L624)
      * query_time: true ClientOption when instanced
        * [only queries the server time once and then works out the offset, query_time option is never persisted (#RSA10k)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L644)
      * TokenParams argument
        * [has no effect on the defaults when null and TokenParam defaults remain the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L661)
        * [updates defaults when present and all previous configured TokenParams are discarded (#RSA10g)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L668)
        * [updates Auth#token_params attribute with an immutable hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L676)
        * [uses TokenParams#timestamp for this request but obtains a new timestamp for subsequence requests (#RSA10g)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L681)
      * AuthOptions argument
        * [has no effect on the defaults when null and AuthOptions defaults remain the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L706)
        * [updates defaults when present and all previous configured AuthOptions are discarded (#RSA10g)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L712)
        * [updates Auth#options attribute with an immutable hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L719)
        * [uses AuthOptions#query_time for this request and will not query_time for subsequent requests (#RSA10g)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L724)
        * [uses AuthOptions#query_time for this request and will query_time again if provided subsequently](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L730)
      * with previous authorisation
        * [requests a new token if token is expired](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L743)
        * [issues a new token every time #authorize is called](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L749)
      * with a lambda for the :auth_callback option
        * [calls the lambda](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L776)
        * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L780)
        * for every subsequent #request_token
          * without a :auth_callback lambda
            * [calls the originally provided block](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L786)
          * with a provided block
            * [does not call the originally provided lambda and calls the new #request_token :auth_callback lambda](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L793)
      * with an explicit token string that expires
        * and a lambda for the :auth_callback option to provide a means to renew the token
          * [calls the lambda once the token has expired and the new token is used](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L820)
      * with an explicit ClientOptions client_id
        * and an incompatible client_id in a TokenDetails object passed to the auth callback
          * [rejects a TokenDetails object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L838)
        * and an incompatible client_id in a TokenRequest object passed to the auth callback and raises an exception
          * [rejects a TokenRequests object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L846)
        * and a token string without any retrievable client_id
          * [rejects a TokenRequests object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L854)
    * #create_token_request
      * [returns a TokenRequest object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L869)
      * [returns a TokenRequest that can be passed to a client that can use it for authentication without an API key](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L873)
      * [uses the key name from the client](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L880)
      * [specifies no TTL (#RSA5)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L884)
      * [specifies no capability (#RSA6)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L898)
      * with a :ttl option below the Token expiry buffer that ensures tokens are renewed 15s before they expire as they are considered expired
        * [uses the Token expiry buffer default + 10s to allow for a token request in flight](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L892)
      * the nonce
        * [is unique for every request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L903)
        * [is at least 16 characters](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L908)
      * with token param :ttl
        * [overrides default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L919)
      * with token param :nonce
        * [overrides default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L919)
      * with token param :client_id
        * [overrides default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L919)
      * when specifying capability
        * [overrides the default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L930)
        * [uses these capabilities when Ably issues an actual token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L934)
      * with additional invalid attributes
        * [are ignored](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L944)
      * when required fields are missing
        * [should raise an exception if key secret is missing](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L955)
        * [should raise an exception if key name is missing](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L959)
      * timestamp attribute
        * [is a Time object in Ruby and is set to the local time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L986)
        * with :query_time auth_option
          * [queries the server for the timestamp](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L971)
        * with :timestamp option
          * [uses the provided timestamp in the token request](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L981)
      * signing
        * [generates a valid HMAC](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1010)
        * lexicographic ordering of channels and operations
          * [HMAC is lexicographic ordered and thus the HMAC is identical](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1037)
          * [is valid when used for authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1043)
    * using token authentication
      * with :token option
        * [authenticates successfully using the provided :token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1070)
        * [disallows publishing on unspecified capability channels](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1074)
        * [fails if timestamp is invalid](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1082)
        * [cannot be renewed automatically](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1090)
        * and the token expires
          * [should indicate an error and not retry the request (#RSA4a)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1124)
      * when implicit as a result of using :client_id
        * and requests to the Ably server are mocked
          * [will send a token request to the server](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1154)
        * a token is created
          * [before a request is made](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1163)
          * [when a message is published](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1167)
          * FAILED: ~~[with capability and TTL defaults (#TK2a, #TK2b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1171)~~
          * [#client_id contains the client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1182)
      * when token expires
        * [automatically renews the token (#RSA4b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1211)
        * [fails if the token renewal fails (#RSA4b)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1221)
      * when :client_id is provided in a token
        * [#client_id contains the client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1245)
    * #client_id_validated?
      * when using basic auth
        * [is false as basic auth users do not have an identity](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1257)
      * when using a token auth string for a token with a client_id
        * [is false as identification is not possible from an opaque token string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1265)
      * when using a token
        * with a client_id
          * [is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1274)
        * with no client_id (anonymous)
          * [is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1282)
        * with a wildcard client_id (anonymous)
          * [is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1290)
      * when using a token request with a client_id
        * [is not true as identification is not confirmed until authenticated](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1299)
        * after authentication
          * [is true as identification is completed during implicit authentication](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1306)
    * when using a :key and basic auth
      * [#using_token_auth? is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1314)
      * [#key attribute contains the key string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1318)
      * [#using_basic_auth? is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1322)
    * deprecated #authorise
      * FAILED: ~~[logs a deprecation warning (#RSA10l)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1331)~~
      * FAILED: ~~[returns a valid token (#RSA10l)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/auth_spec.rb#L1336)~~

### Ably::Rest
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/base_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb))_
  * transport protocol
    * when protocol is not defined it defaults to :msgpack
      * [uses MsgPack](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L27)
    * when option {:protocol=>:json} is used
      * [uses JSON](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L43)
    * when option {:use_binary_protocol=>false} is used
      * [uses JSON](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L43)
    * when option {:protocol=>:msgpack} is used
      * [uses MsgPack](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L60)
    * when option {:use_binary_protocol=>true} is used
      * [uses MsgPack](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L60)
  * using JSON protocol
    * failed requests
      * due to invalid Auth
        * [should raise an InvalidRequest exception with a valid error message and code](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L75)
      * server error with JSON error response body
        * [should raise a ServerError exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L94)
      * 500 server error without a valid JSON response body
        * [should raise a ServerError exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L105)
    * token authentication failures
      * when auth#token_renewable?
        * [should automatically reissue a token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L143)
      * when NOT auth#token_renewable?
        * [should raise an TokenExpired exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L158)
  * using MsgPack protocol
    * failed requests
      * due to invalid Auth
        * [should raise an InvalidRequest exception with a valid error message and code](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L75)
      * server error with JSON error response body
        * [should raise a ServerError exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L94)
      * 500 server error without a valid JSON response body
        * [should raise a ServerError exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L105)
    * token authentication failures
      * when auth#token_renewable?
        * [should automatically reissue a token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L143)
      * when NOT auth#token_renewable?
        * [should raise an TokenExpired exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/acceptance/rest/base_spec.rb#L158)

### Ably::Logger
_(see [lib/submodules/ably-ruby/spec/unit/logger_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/logger_spec.rb))_
  * [uses the language provided Logger by default](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/logger_spec.rb#L15)
  * with a custom Logger
    * with an invalid interface
      * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/logger_spec.rb#L118)
    * with a valid interface
      * FAILED: ~~[is used](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/logger_spec.rb#L129)~~
  * with blocks
    * [does not call the block unless the log level is met](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/logger_spec.rb#L144)
    * with an exception in the logger block
      * [catches the error and continues](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/logger_spec.rb#L159)

### Ably::Auth
_(see [lib/submodules/ably-ruby/spec/unit/auth_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb))_
  * client_id option
    * with nil value
      * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L20)
    * as UTF_8 string
      * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L28)
      * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L32)
    * as SHIFT_JIS string
      * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L40)
      * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L44)
    * as ASCII_8BIT string
      * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L52)
      * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L56)
    * as Integer
      * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L64)
  * defaults
    * [should have no default TTL](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L71)
    * [should have no default capability](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/auth_spec.rb#L75)

### Ably::Models::AuthDetails
_(see [lib/submodules/ably-ruby/spec/unit/models/auth_details_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/auth_details_spec.rb))_
  * behaves like a model
    * attributes
      * #access_token
        * [retrieves attribute :access_token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L80)
  * ==
    * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/auth_details_spec.rb#L17)
    * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/auth_details_spec.rb#L22)
    * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/auth_details_spec.rb#L26)

### Ably::Models::Stats
_(see [lib/submodules/ably-ruby/spec/unit/models/stats_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb))_
  * #all stats
    * [returns a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L17)
    * [returns value for message counts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L21)
    * [returns value for all data transferred](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L25)
    * [returns zero for empty values](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L29)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L33)
    * #all
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L39)
    * #presence
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L39)
    * #messages
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L39)
  * #persisted stats
    * [returns a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L17)
    * [returns value for message counts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L21)
    * [returns value for all data transferred](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L25)
    * [returns zero for empty values](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L29)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L33)
    * #all
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L39)
    * #presence
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L39)
    * #messages
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L39)
  * #inbound stats
    * [returns a MessageTraffic object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L59)
    * [returns value for realtime message counts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L63)
    * [returns value for all presence data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L67)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L71)
    * #realtime
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L77)
    * #rest
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L77)
    * #webhook
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L77)
    * #all
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L77)
  * #outbound stats
    * [returns a MessageTraffic object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L59)
    * [returns value for realtime message counts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L63)
    * [returns value for all presence data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L67)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L71)
    * #realtime
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L77)
    * #rest
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L77)
    * #webhook
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L77)
    * #all
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L77)
  * #connections stats
    * [returns a ConnectionTypes object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L91)
    * [returns value for tls opened counts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L95)
    * [returns value for all peak connections](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L99)
    * [returns zero for empty values](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L103)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L107)
    * #tls
      * [is a ResourceCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L113)
    * #plain
      * [is a ResourceCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L113)
    * #all
      * [is a ResourceCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L113)
  * #channels stats
    * [returns a ResourceCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L126)
    * [returns value for opened counts](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L130)
    * [returns value for peak channels](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L134)
    * [returns zero for empty values](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L138)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L142)
    * #opened
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L148)
    * #peak
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L148)
    * #mean
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L148)
    * #min
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L148)
    * #refused
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L148)
  * #api_requests stats
    * [returns a RequestCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L164)
    * [returns value for succeeded](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L168)
    * [returns value for failed](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L172)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L176)
    * #succeeded
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L182)
    * #failed
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L182)
    * #refused
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L182)
  * #token_requests stats
    * [returns a RequestCount object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L164)
    * [returns value for succeeded](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L168)
    * [returns value for failed](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L172)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L176)
    * #succeeded
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L182)
    * #failed
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L182)
    * #refused
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L182)
  * #interval_granularity
    * [returns the granularity of the interval_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L193)
  * #interval_time
    * [returns a Time object representing the start of the interval](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L201)
  * class methods
    * #to_interval_id
      * when time zone of time argument is UTC
        * [converts time 2014-02-03:05:06 with granularity :month into 2014-02](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L209)
        * [converts time 2014-02-03:05:06 with granularity :day into 2014-02-03](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L213)
        * [converts time 2014-02-03:05:06 with granularity :hour into 2014-02-03:05](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L217)
        * [converts time 2014-02-03:05:06 with granularity :minute into 2014-02-03:05:06](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L221)
        * [fails with invalid granularity](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L225)
        * [fails with invalid time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L229)
      * when time zone of time argument is +02:00
        * [converts time 2014-02-03:06 with granularity :hour into 2014-02-03:04 at UTC +00:00](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L235)
    * #from_interval_id
      * [converts a month interval_id 2014-02 into a Time object in UTC 0](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L242)
      * [converts a day interval_id 2014-02-03 into a Time object in UTC 0](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L247)
      * [converts an hour interval_id 2014-02-03:05 into a Time object in UTC 0](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L252)
      * [converts a minute interval_id 2014-02-03:05:06 into a Time object in UTC 0](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L257)
      * [fails with an invalid interval_id 14-20](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L262)
    * #granularity_from_interval_id
      * [returns a :month interval_id for 2014-02](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L268)
      * [returns a :day interval_id for 2014-02-03](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L272)
      * [returns a :hour interval_id for 2014-02-03:05](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L276)
      * [returns a :minute interval_id for 2014-02-03:05:06](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L280)
      * [fails with an invalid interval_id 14-20](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/stats_spec.rb#L284)

### Ably::Models::HttpPaginatedResponse: #HP1 -> #HP8
_(see [lib/submodules/ably-ruby/spec/unit/models/http_paginated_result_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb))_
  * #items
    * [returns correct length from body](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L33)
    * [is Enumerable](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L37)
    * [is iterable](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L41)
    * [provides [] accessor method](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L59)
    * [#first gets the first item in page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L65)
    * [#last gets the last item in page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L69)
    * #each
      * [returns an enumerator](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L46)
      * [yields each item](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L50)
  * with non paged http response
    * [is the last page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L174)
    * [does not have next page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L178)
    * [does not support pagination](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L182)
    * [returns nil when accessing next page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L186)
    * [returns nil when accessing first page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L190)
  * with paged http response
    * [has next page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L208)
    * [is not the last page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L212)
    * [supports pagination](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L216)
    * accessing next page
      * [returns another HttpPaginatedResponse](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L244)
      * [retrieves the next page of results](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L248)
      * [does not have a next page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L253)
      * [is the last page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L257)
      * [returns nil when trying to access the last page when it is the last page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L261)
      * and then first page
        * [returns a HttpPaginatedResponse](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L272)
        * [retrieves the first page of results](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L276)
  * response metadata
    * successful response
      * [#success? is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L288)
      * [#status_code reflects status code](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L292)
      * [#error_code to be empty](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L296)
      * [#error_message to be empty](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L300)
      * [#headers to be a hash](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L304)
    * failed response
      * [#success? is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L313)
      * [#status_code reflects status code](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L317)
      * [#error_code to be populated](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L321)
      * [#error_message to be populated](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L325)
      * [#headers to be present](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L329)
  * #items Array conversion and nil handling #HP3
    * with Json Array
      * [is an array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L344)
    * with Json Object
      * [is an array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L354)
    * with empty response
      * [is an array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L365)
    * with nil response
      * [is an array](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/http_paginated_result_spec.rb#L375)

### Ably::Models::TokenRequest
_(see [lib/submodules/ably-ruby/spec/unit/models/token_request_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb))_
  * behaves like a model
    * attributes
      * #key_name
        * [retrieves attribute :key_name](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #nonce
        * [retrieves attribute :nonce](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #mac
        * [retrieves attribute :mac](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L80)
  * attributes
    * #capability
      * [retrieves attribute :capability as parsed JSON](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L18)
    * #timestamp
      * with :timestamp option as milliseconds in constructor
        * [retrieves attribute :timestamp as Time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L29)
      * with :timestamp option as Time in constructor
        * [retrieves attribute :timestamp as Time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L38)
      * when converted to JSON
        * [is in milliseconds since epoch](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L47)
    * #ttl
      * with :ttl option as milliseconds in constructor
        * [retrieves attribute :ttl as seconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L59)
      * when converted to JSON
        * [is in milliseconds since epoch](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L68)
  * ==
    * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L78)
    * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L83)
    * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L87)
  * from_json (#TE6)
    * with Ruby idiomatic Hash object
      * [returns a valid TokenRequest object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L130)
    * with JSON-like object
      * [returns a valid TokenRequest object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L152)
    * with JSON string
      * [returns a valid TokenRequest object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_request_spec.rb#L174)

### Ably::Models::ConnectionDetails
_(see [lib/submodules/ably-ruby/spec/unit/models/connection_details_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_details_spec.rb))_
  * behaves like a model
    * attributes
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #connection_key
        * [retrieves attribute :connection_key](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #max_message_size
        * [retrieves attribute :max_message_size](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #max_frame_size
        * [retrieves attribute :max_frame_size](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #max_inbound_rate
        * [retrieves attribute :max_inbound_rate](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L80)
  * attributes
    * #connection_state_ttl (#CD2f)
      * [retrieves attribute :connection_state_ttl and converts it from ms to s](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_details_spec.rb#L20)
    * #max_idle_interval (#CD2h)
      * [retrieves attribute :max_idle_interval and converts it from ms to s](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_details_spec.rb#L30)
  * ==
    * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_details_spec.rb#L39)
    * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_details_spec.rb#L44)
    * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_details_spec.rb#L48)

### Ably::Models::PresenceMessage
_(see [lib/submodules/ably-ruby/spec/unit/models/presence_message_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb))_
  * behaves like a model
    * attributes
      * #id
        * [retrieves attribute :id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #data
        * [retrieves attribute :data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #encoding
        * [retrieves attribute :encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L80)
  * #connection_id attribute
    * when this model has a connectionId attribute
      * but no protocol message
        * [uses the model value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L25)
      * with a protocol message with a different connectionId
        * [uses the model value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L33)
    * when this model has no connectionId attribute
      * and no protocol message
        * [uses the model value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L43)
      * with a protocol message with a connectionId
        * [uses the model value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L51)
  * #member_key attribute
    * [is string in format connection_id:client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L61)
    * with the same client id across multiple connections
      * [is unique](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L69)
    * with a single connection and different client_ids
      * [is unique](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L78)
  * #timestamp
    * [retrieves attribute :timestamp as a Time object from ProtocolMessage](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L86)
  * initialized with
    * :client_id
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L138)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L142)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L150)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L154)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L162)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L166)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L174)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L182)
    * :connection_id
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L138)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L142)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L150)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L154)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L162)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L166)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L174)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L182)
    * :encoding
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L138)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L142)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L150)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L154)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L162)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L166)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L174)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L182)
  * #from_encoded (#TP4)
    * with no encoding
      * [returns a presence message object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L395)
      * with a block
        * [does not call the block](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L403)
    * with an encoding
      * [returns a presence message object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L420)
    * with a custom encoding
      * [returns a presence message object with the residual incompatible transforms left in the encoding property](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L435)
    * with a Cipher encoding
      * [returns a presence message object with the residual incompatible transforms left in the encoding property](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L454)
    * with invalid Cipher encoding
      * without a block
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L471)
      * with a block
        * [calls the block with the exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L477)
  * #from_encoded_array (#TP4)
    * with no encoding
      * [returns an Array of presence message objects](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L496)
  * #shallow_clone
    * with inherited attributes from ProtocolMessage
      * [creates a duplicate of the message without any ProtocolMessage dependency](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L516)
    * with embedded attributes for all fields
      * [creates a duplicate of the message without any ProtocolMessage dependency](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L530)
    * with new attributes passed in to the method
      * [creates a duplicate of the message without any ProtocolMessage dependency](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L546)
      * with an invalid ProtocolMessage (missing an ID)
        * [allows an ID to be passed in to the shallow clone that takes precedence](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L558)
      * with mixing of cases
        * [resolves case issues and can use camelCase or snake_case](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/presence_message_spec.rb#L565)

### Ably::Models::ErrorInfo
_(see [lib/submodules/ably-ruby/spec/unit/models/error_info_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/error_info_spec.rb))_
  * behaves like a model
    * attributes
      * #code
        * [retrieves attribute :code](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #status_code
        * [retrieves attribute :status_code](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #message
        * [retrieves attribute :message](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L80)
  * #status
    * [is an alias for #status_code](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/error_info_spec.rb#L13)

### Ably::Models::Message
_(see [lib/submodules/ably-ruby/spec/unit/models/message_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb))_
  * behaves like a model
    * attributes
      * #id
        * [retrieves attribute :id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #name
        * [retrieves attribute :name](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #data
        * [retrieves attribute :data](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #encoding
        * [retrieves attribute :encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L80)
  * #timestamp
    * [retrieves attribute :timestamp as Time object from ProtocolMessage](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L22)
  * #extras (#TM2i)
    * when missing
      * [is nil](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L33)
    * when a string
      * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L40)
    * when a Hash
      * [contains a Hash Json object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L47)
    * when a Json Array
      * [contains a Json Array object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L54)
  * #connection_id attribute
    * when this model has a connectionId attribute
      * but no protocol message
        * [uses the model value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L69)
      * with a protocol message with a different connectionId
        * [uses the model value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L77)
    * when this model has no connectionId attribute
      * and no protocol message
        * [uses the model value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L87)
      * with a protocol message with a connectionId
        * [uses the model value](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L95)
  * initialized with
    * :name
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L122)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L126)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L134)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L138)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L146)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L150)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L158)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L166)
    * :client_id
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L122)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L126)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L134)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L138)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L146)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L150)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L158)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L166)
    * :encoding
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L122)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L126)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L134)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L138)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L146)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L150)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L158)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L166)
  * #from_encoded (#TM3)
    * with no encoding
      * [returns a message object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L422)
      * with a block
        * [does not call the block](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L430)
    * with an encoding
      * [returns a message object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L447)
    * with a custom encoding
      * [returns a message object with the residual incompatible transforms left in the encoding property](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L462)
    * with a Cipher encoding
      * [returns a message object with the residual incompatible transforms left in the encoding property](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L481)
    * with invalid Cipher encoding
      * without a block
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L499)
      * with a block
        * [calls the block with the exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L505)
  * #from_encoded_array (#TM3)
    * with no encoding
      * [returns an Array of message objects](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/message_spec.rb#L524)

### Ably::Models::ProtocolMessage
_(see [lib/submodules/ably-ruby/spec/unit/models/protocol_message_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb))_
  * behaves like a model
    * attributes
      * #id
        * [retrieves attribute :id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #channel
        * [retrieves attribute :channel](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #channel_serial
        * [retrieves attribute :channel_serial](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #connection_id
        * [retrieves attribute :connection_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #connection_key
        * [retrieves attribute :connection_key](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L80)
  * attributes
    * #timestamp
      * [retrieves attribute :timestamp as Time object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L75)
    * #count
      * when missing
        * [is 1](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L84)
      * when non numeric
        * [is 1](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L91)
      * when greater than 1
        * [is the value of count](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L98)
    * #message_serial
      * [converts :msg_serial to an Integer](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L106)
    * #has_message_serial?
      * without msg_serial
        * [returns false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L116)
      * with msg_serial
        * [returns true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L124)
    * #connection_serial
      * [converts :connection_serial to an Integer](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L132)
    * #flags (#TR4i)
      * when nil
        * [is zero](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L142)
      * when numeric
        * [is an Integer](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L150)
      * when presence flag present
        * [#has_presence_flag? is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L158)
        * [#has_channel_resumed_flag? is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L162)
      * when channel resumed flag present
        * [#has_channel_resumed_flag? is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L170)
        * [#has_presence_flag? is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L174)
      * when channel resumed and presence flags present
        * [#has_channel_resumed_flag? is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L182)
        * [#has_presence_flag? is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L186)
      * when has another future flag
        * [#has_presence_flag? is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L194)
        * [#has_backlog_flag? is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L198)
    * #has_connection_serial?
      * without connection_serial
        * [returns false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L208)
      * with connection_serial
        * [returns true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L216)
    * #serial
      * with underlying msg_serial
        * [converts :msg_serial to an Integer](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L225)
      * with underlying connection_serial
        * [converts :connection_serial to an Integer](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L233)
      * with underlying connection_serial and msg_serial
        * [prefers connection_serial and converts :connection_serial to an Integer](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L241)
    * #has_serial?
      * without msg_serial or connection_serial
        * [returns false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L252)
      * with msg_serial
        * [returns true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L260)
      * with connection_serial
        * [returns true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L268)
    * #error
      * with no error attribute
        * [returns nil](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L278)
      * with nil error
        * [returns nil](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L286)
      * with error
        * [returns a valid ErrorInfo object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L294)
    * #messages (#TR4k)
      * [contains Message objects](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L304)
    * #presence (#TR4l)
      * [contains PresenceMessage objects](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L314)
    * #connection_details (#TR4o)
      * with a JSON value
        * [contains a ConnectionDetails object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L327)
        * [contains the attributes from the JSON connectionDetails](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L331)
      * without a JSON value
        * [contains an empty ConnectionDetails object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L340)
    * #auth (#TR4p)
      * with a JSON value
        * [contains a AuthDetails object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L354)
        * [contains the attributes from the JSON auth details](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L358)
      * without a JSON value
        * [contains an empty AuthDetails object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L366)
    * #connection_key (#TR4e)
      * existing only in #connection_details.connection_key
        * [is returned](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L377)
      * existing in both #connection_key and #connection_details.connection_key
        * [returns #connection_details.connection_key as #connection_key will be deprecated > 0.8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/protocol_message_spec.rb#L385)

### Ably::Models::ConnectionStateChange
_(see [lib/submodules/ably-ruby/spec/unit/models/connection_state_change_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb))_
  * #current (#TA2)
    * [is required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L10)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L14)
  * #previous(#TA2)
    * [is required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L20)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L24)
  * #event(#TA5)
    * [is not required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L30)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L34)
  * #retry_in (#TA2)
    * [is not required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L41)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L45)
  * #reason (#TA3)
    * [is not required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L51)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L55)
  * invalid attributes
    * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/connection_state_change_spec.rb#L61)

### Ably::Models::TokenDetails
_(see [lib/submodules/ably-ruby/spec/unit/models/token_details_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb))_
  * behaves like a model
    * attributes
      * #token
        * [retrieves attribute :token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #key_name
        * [retrieves attribute :key_name](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/model_behaviour.rb#L80)
  * attributes
    * #capability
      * [retrieves attribute :capability as parsed JSON](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L21)
    *
      * #issued with :issued option as milliseconds in constructor
        * [retrieves attribute :issued as Time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L32)
      * #issued with :issued option as a Time in constructor
        * [retrieves attribute :issued as Time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L41)
      * #issued when converted to JSON
        * [is in milliseconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L50)
      * #expires with :expires option as milliseconds in constructor
        * [retrieves attribute :expires as Time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L32)
      * #expires with :expires option as a Time in constructor
        * [retrieves attribute :expires as Time](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L41)
      * #expires when converted to JSON
        * [is in milliseconds](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L50)
    * #expired?
      * once grace period buffer has passed
        * [is true](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L63)
      * within grace period buffer
        * [is false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L71)
      * when expires is not available (i.e. string tokens)
        * [is always false](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L79)
  * ==
    * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L89)
    * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L94)
    * [is false when class type differs](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L98)
  * to_json
    * with all attributes and values
      * [returns all attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L130)
    * with only a token string
      * [returns populated attributes](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L143)
  * from_json (#TD7)
    * with Ruby idiomatic Hash object
      * [returns a valid TokenDetails object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L169)
    * with JSON-like object
      * [returns a valid TokenDetails object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L192)
    * with JSON string
      * [returns a valid TokenDetails object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/token_details_spec.rb#L214)

### Ably::Models::PaginatedResult
_(see [lib/submodules/ably-ruby/spec/unit/models/paginated_result_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb))_
  * #items
    * [returns correct length from body](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L31)
    * [is Enumerable](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L35)
    * [is iterable](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L39)
    * [provides [] accessor method](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L57)
    * [#first gets the first item in page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L63)
    * [#last gets the last item in page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L67)
    * #each
      * [returns an enumerator](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L44)
      * [yields each item](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L48)
  * with non paged http response
    * [is the last page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L172)
    * [does not have next page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L176)
    * [does not support pagination](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L180)
    * [returns nil when accessing next page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L184)
    * [returns nil when accessing first page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L188)
  * with paged http response
    * [has next page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L206)
    * [is not the last page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L210)
    * [supports pagination](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L214)
    * accessing next page
      * [returns another PaginatedResult](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L242)
      * [retrieves the next page of results](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L246)
      * [does not have a next page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L251)
      * [is the last page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L255)
      * [returns nil when trying to access the last page when it is the last page](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L259)
      * and then first page
        * [returns a PaginatedResult](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L270)
        * [retrieves the first page of results](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/paginated_result_spec.rb#L274)

### Ably::Models::ChannelStateChange
_(see [lib/submodules/ably-ruby/spec/unit/models/channel_state_change_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb))_
  * #current (#TH1)
    * [is required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L10)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L14)
  * #previous (#TH2)
    * [is required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L20)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L24)
  * #event (#TH5)
    * [is not required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L30)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L34)
  * #reason (#TH3)
    * [is not required](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L40)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L44)
  * #resumed (#TH4)
    * [is false when ommitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L50)
    * [is true when provided](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L54)
  * invalid attributes
    * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/channel_state_change_spec.rb#L60)

### Ably::Models::CipherParams
_(see [lib/submodules/ably-ruby/spec/unit/models/cipher_params_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb))_
  * :key missing from constructor
    * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L8)
  * #key
    * with :key in constructor
      * as nil
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L20)
      * as a base64 encoded string
        * [is a binary representation of the base64 encoded string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L29)
      * as a URL safe base64 encoded string
        * [is a binary representation of the URL safe base64 encoded string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L40)
      * as a binary encoded string
        * [contains the binary string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L48)
      * with an incompatible :key_length constructor param
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L58)
      * with an unsupported :key_length for aes-cbc encryption
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L67)
      * with an invalid type
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L76)
  * with specified params in the constructor
    * #cipher_type
      * [contains the complete algorithm string as an upper case string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L88)
    * #mode
      * [contains the mode](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L94)
    * #algorithm
      * [contains the algorithm](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L100)
    * #key_length
      * [contains the key_length](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L106)
  * with combined param in the constructor
    * #cipher_type
      * [contains the complete algorithm string as an upper case string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L117)
    * #mode
      * [contains the mode](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L123)
    * #algorithm
      * [contains the algorithm](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L129)
    * #key_length
      * [contains the key_length](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/models/cipher_params_spec.rb#L135)

### Ably::Rest::Client
_(see [lib/submodules/ably-ruby/spec/unit/rest/client_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/client_spec.rb))_
  * behaves like a client initializer
    * with invalid arguments
      * empty hash
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L28)
      * nil
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L36)
      * key: "invalid"
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L44)
      * key: "invalid:asdad"
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L52)
      * key and key_name
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L60)
      * key and key_secret
        * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L68)
      * client_id as only option
        * [requires a valid key](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L76)
    * with valid arguments
      * key only
        * [connects to the Ably service](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L87)
        * [uses basic auth](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L91)
      * with a string key instead of options hash
        * [sets the key](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L111)
        * [sets the key_name](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L115)
        * [sets the key_secret](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L119)
        * [uses basic auth](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L123)
      * with a string token key instead of options hash
        * [sets the token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L135)
      * with token
        * [sets the token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L143)
      * with token_details
        * [sets the token](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L151)
      * with token_params
        * [configures default_token_params](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L159)
      * endpoint
        * [defaults to production](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L170)
        * with environment option
          * [uses an alternate endpoint](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L177)
        * with rest_host option
          * [uses an alternate endpoint for REST clients](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L185)
        * with realtime_host option
          * PENDING: *[uses an alternate endpoint for Realtime clients](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L194)*
        * with port option and non-TLS connections
          * [uses the custom port for non-TLS requests](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L203)
        * with tls_port option and a TLS connection
          * [uses the custom port for TLS requests](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L211)
      * tls
        * [defaults to TLS](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L234)
        * set to false
          * [uses plain text](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L225)
          * [uses HTTP](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L229)
      * logger
        * default
          * [uses Ruby Logger](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L245)
          * [specifies Logger::WARN log level](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L249)
        * with log_level :none
          * [silences all logging with a NilLogger](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L257)
        * with custom logger and log_level
          * FAILED: ~~[uses the custom logger](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L267)~~
          * FAILED: ~~[sets the custom log level](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L271)~~
    * delegators
      * [delegates :client_id to .auth](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L285)
      * [delegates :auth_options to .auth](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/shared/client_initializer_behaviour.rb#L290)
  * initializer options
    * TLS
      * disabled
        * [fails for any operation with basic auth and attempting to send an API key over a non-secure connection (#RSA1)](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/client_spec.rb#L17)
    * :use_token_auth
      * set to false
        * with a key and :tls => false
          * [fails for any operation with basic auth and attempting to send an API key over a non-secure connection](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/client_spec.rb#L28)
        * without a key
          * [fails as a key is required if not using token auth](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/client_spec.rb#L36)
      * set to true
        * without a key or token
          * [fails as a key is required to issue tokens](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/client_spec.rb#L46)
  * request_id generation
    * [includes request_id in URL](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/client_spec.rb#L56)

### Ably::Rest::Channels
_(see [lib/submodules/ably-ruby/spec/unit/rest/channels_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb))_
  * creating channels
    * [#get creates a channel](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L12)
    * [#get will reuse the channel object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L17)
    * [[] creates a channel](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L23)
  * #fetch
    * [retrieves a channel if it exists](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L30)
    * [calls the block if channel is missing](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L35)
  * destroying channels
    * [#release releases the channel resoures](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L43)
  * is Enumerable
    * [allows enumeration](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L59)
    * [provides #length](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L75)
    * #each
      * [returns an enumerator](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L64)
      * [yields each channel](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channels_spec.rb#L68)

### Ably::Rest
_(see [lib/submodules/ably-ruby/spec/unit/rest/rest_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/rest_spec.rb))_
  * [constructor returns an Ably::Rest::Client](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/rest_spec.rb#L7)

### Ably::Rest::Channel
_(see [lib/submodules/ably-ruby/spec/unit/rest/channel_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb))_
  * #initializer
    * as UTF_8 string
      * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L16)
      * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L20)
    * as frozen UTF_8 string
      * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L29)
      * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L33)
    * as SHIFT_JIS string
      * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L41)
      * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L45)
    * as ASCII_8BIT string
      * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L53)
      * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L57)
    * as Integer
      * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L65)
    * as Nil
      * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L73)
  * #publish name argument
    * as UTF_8 string
      * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L85)
    * as frozen UTF_8 string
      * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L94)
    * as SHIFT_JIS string
      * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L102)
    * as ASCII_8BIT string
      * [is permitted](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L110)
    * as Integer
      * [raises an argument error](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/rest/channel_spec.rb#L118)

### Ably::Util::Crypto
_(see [lib/submodules/ably-ruby/spec/unit/util/crypto_spec.rb](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb))_
  * defaults
    * [match other client libraries](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L19)
  * get_default_params
    * with just a :key param
      * [uses the defaults](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L29)
      * [contains the provided key](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L35)
      * [returns a CipherParams object](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L39)
    * without a :key param
      * [raises an exception](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L47)
    * with a base64-encoded :key param
      * [converts the key to binary](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L55)
    * with provided params
      * [overrides the defaults](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L67)
  * encrypts & decrypt
    * [#encrypt encrypts a string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L79)
    * [#decrypt decrypts a string](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L84)
  * encrypting an empty string
    * [raises an ArgumentError](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L93)
  * using shared client lib fixture data
    * with AES-128-CBC
      * behaves like an Ably encrypter and decrypter (#RTL7d)
        * text payload
          * [encrypts exactly the same binary data as other client libraries](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L116)
          * [decrypts exactly the same binary data as other client libraries](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L120)
    * with AES-256-CBC
      * behaves like an Ably encrypter and decrypter (#RTL7d)
        * text payload
          * [encrypts exactly the same binary data as other client libraries](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L116)
          * [decrypts exactly the same binary data as other client libraries](https://github.com/ably/ably-ruby/tree/4ac46e440446b1e9d2d3bd201ad35b1d2111df91/spec/unit/util/crypto_spec.rb#L120)

  -------

  ## Test summary

  * Passing tests: 1186
  * Pending tests: 1
  * Failing tests: 0
