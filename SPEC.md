# Ably REST Client Library 0.8.6 Specification

### Ably::Auth
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/auth_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb))_
  * using JSON protocol
    * [has immutable options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L60)
    * #request_token
      * [creates a TokenRequest automatically and sends it to Ably to obtain a token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L75)
      * [returns a valid TokenDetails object in the expected format with valid issued and expires attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L84)
      * with token_param :client_id
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :capability
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :nonce
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :timestamp
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :ttl
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with :key option
        * [key_name is used in request and signing uses key_secret](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L147)
      * with :key_name & :key_secret options
        * [key_name is used in request and signing uses key_secret](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L177)
      * with :query_time option
        * [queries the server for the time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L185)
      * without :query_time option
        * [does not query the server for the time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L194)
      * with :auth_url option merging
        * with existing configured auth options
          * using unspecified :auth_method
            * [requests a token using a GET request with provided headers, and merges client_id into auth_params](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L234)
            * with provided token_params
              * [merges provided token_params with existing auth_params and client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L242)
            * with provided auth option auth_params and auth_headers
              * [replaces any preconfigured auth_params](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L250)
          * using :get :auth_method and query params in the URL
            * [requests a token using a GET request with provided headers, and merges client_id into auth_params and existing URL querystring into new URL querystring](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L261)
          * using :post :auth_method
            * [requests a token using a POST request with provided headers, and merges client_id into auth_params as form-encoded post data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L271)
      * with :auth_url option
        * when response from :auth_url is a valid token request
          * [requests a token from :auth_url using an HTTP GET request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L321)
          * [returns a valid token generated from the token request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L326)
          * with :query_params
            * [requests a token from :auth_url with the :query_params](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L333)
          * with :headers
            * [requests a token from :auth_url with the HTTP headers set](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L341)
          * with POST
            * [requests a token from :auth_url using an HTTP POST instead of the default GET](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L349)
        * when response from :auth_url is a token details object
          * [returns TokenDetails created from the token JSON](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L374)
        * when response from :auth_url is text/plain content type and a token string
          * [returns TokenDetails created from the token JSON](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L392)
        * when response is invalid
          * 500
            * [raises ServerError](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L406)
          * XML
            * [raises InvalidResponseBody](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L417)
      * with a Proc for the :auth_callback option
        * that returns a TokenRequest
          * [calls the Proc with token_params when authenticating to obtain the request token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L440)
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L444)
          * when authorised
            * [sets Auth#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L451)
            * [sets Client#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L455)
        * that returns a TokenDetails JSON object
          * [calls the Proc when authenticating to obtain the request token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L489)
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L494)
          * when authorised
            * [sets Auth#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L506)
            * [sets Client#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L510)
        * that returns a TokenDetails object
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L525)
        * that returns a Token string
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L541)
      * with auth_option :client_id
        * [returns a token with the client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L571)
      * with token_param :client_id
        * [returns a token with the client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L580)
    * before #authorise has been called
      * [has no current_token_details](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L587)
    * #authorise
      * [updates the persisted token params that are then used for subsequent authorise requests](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L637)
      * [updates the persisted token params that are then used for subsequent authorise requests](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L643)
      * when called for the first time since the client has been instantiated
        * [passes all auth_options and token_params to #request_token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L601)
        * [returns a valid token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L606)
        * [issues a new token if option :force => true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L610)
      * with previous authorisation
        * [does not request a token if current_token_details has not expired](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L621)
        * [requests a new token if token is expired](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L626)
        * [issues a new token if option :force => true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L632)
      * with a Proc for the :auth_callback option
        * [calls the Proc](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L659)
        * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L663)
        * for every subsequent #request_token
          * without a :auth_callback Proc
            * [calls the originally provided block](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L669)
          * with a provided block
            * [does not call the originally provided Proc and calls the new #request_token :auth_callback Proc](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L676)
      * with an explicit token string that expires
        * and a Proc for the :auth_callback option to provide a means to renew the token
          * [calls the Proc once the token has expired and the new token is used](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L703)
      * with an explicit ClientOptions client_id
        * and an incompatible client_id in a TokenDetails object passed to the auth callback
          * [rejects a TokenDetails object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L721)
        * and an incompatible client_id in a TokenRequest object passed to the auth callback and raises an exception
          * [rejects a TokenRequests object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L729)
        * and a token string without any retrievable client_id
          * [rejects a TokenRequests object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L737)
    * #create_token_request
      * [returns a TokenRequest object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L752)
      * [returns a TokenRequest that can be passed to a client that can use it for authentication without an API key](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L756)
      * [uses the key name from the client](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L763)
      * [uses the default TTL](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L767)
      * [uses the default capability](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L780)
      * with a :ttl option below the Token expiry buffer that ensures tokens are renewed 15s before they expire as they are considered expired
        * [uses the Token expiry buffer default + 10s to allow for a token request in flight](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L774)
      * the nonce
        * [is unique for every request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L785)
        * [is at least 16 characters](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L790)
      * with token param :ttl
        * [overrides default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L801)
      * with token param :nonce
        * [overrides default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L801)
      * with token param :client_id
        * [overrides default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L801)
      * when specifying capability
        * [overrides the default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L812)
        * [uses these capabilities when Ably issues an actual token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L816)
      * with additional invalid attributes
        * [are ignored](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L826)
      * when required fields are missing
        * [should raise an exception if key secret is missing](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L837)
        * [should raise an exception if key name is missing](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L841)
      * timestamp attribute
        * [is a Time object in Ruby and is set to the local time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L868)
        * with :query_time auth_option
          * [queries the server for the timestamp](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L853)
        * with :timestamp option
          * [uses the provided timestamp in the token request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L863)
      * signing
        * [generates a valid HMAC](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L892)
    * using token authentication
      * with :token option
        * [authenticates successfully using the provided :token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L915)
        * [disallows publishing on unspecified capability channels](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L919)
        * [fails if timestamp is invalid](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L927)
        * [cannot be renewed automatically](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L935)
      * when implicit as a result of using :client_id
        * and requests to the Ably server are mocked
          * [will send a token request to the server](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L963)
        * a token is created
          * [before a request is made](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L972)
          * [when a message is published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L976)
          * [with capability and TTL defaults](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L980)
          * [#client_id contains the client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L991)
      * when :client_id is provided in a token
        * [#client_id contains the client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1006)
    * #client_id_validated?
      * when using basic auth
        * [is false as basic auth users do not have an identity](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1018)
      * when using a token auth string for a token with a client_id
        * [is false as identification is not possible from an opaque token string](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1026)
      * when using a token
        * with a client_id
          * [is true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1035)
        * with no client_id (anonymous)
          * [is true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1043)
        * with a wildcard client_id (anonymous)
          * [is false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1051)
      * when using a token request with a client_id
        * [is not true as identification is not confirmed until authenticated](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1060)
        * after authentication
          * [is true as identification is completed during implicit authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1067)
    * when using a :key and basic auth
      * [#using_token_auth? is false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1075)
      * [#key attribute contains the key string](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1079)
      * [#using_basic_auth? is true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1083)
  * using MsgPack protocol
    * [has immutable options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L60)
    * #request_token
      * [creates a TokenRequest automatically and sends it to Ably to obtain a token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L75)
      * [returns a valid TokenDetails object in the expected format with valid issued and expires attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L84)
      * with token_param :client_id
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :capability
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :nonce
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :timestamp
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with token_param :ttl
        * [overrides default and uses camelCase notation for attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L117)
      * with :key option
        * [key_name is used in request and signing uses key_secret](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L147)
      * with :key_name & :key_secret options
        * [key_name is used in request and signing uses key_secret](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L177)
      * with :query_time option
        * [queries the server for the time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L185)
      * without :query_time option
        * [does not query the server for the time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L194)
      * with :auth_url option merging
        * with existing configured auth options
          * using unspecified :auth_method
            * [requests a token using a GET request with provided headers, and merges client_id into auth_params](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L234)
            * with provided token_params
              * [merges provided token_params with existing auth_params and client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L242)
            * with provided auth option auth_params and auth_headers
              * [replaces any preconfigured auth_params](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L250)
          * using :get :auth_method and query params in the URL
            * [requests a token using a GET request with provided headers, and merges client_id into auth_params and existing URL querystring into new URL querystring](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L261)
          * using :post :auth_method
            * [requests a token using a POST request with provided headers, and merges client_id into auth_params as form-encoded post data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L271)
      * with :auth_url option
        * when response from :auth_url is a valid token request
          * [requests a token from :auth_url using an HTTP GET request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L321)
          * [returns a valid token generated from the token request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L326)
          * with :query_params
            * [requests a token from :auth_url with the :query_params](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L333)
          * with :headers
            * [requests a token from :auth_url with the HTTP headers set](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L341)
          * with POST
            * [requests a token from :auth_url using an HTTP POST instead of the default GET](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L349)
        * when response from :auth_url is a token details object
          * [returns TokenDetails created from the token JSON](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L374)
        * when response from :auth_url is text/plain content type and a token string
          * [returns TokenDetails created from the token JSON](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L392)
        * when response is invalid
          * 500
            * [raises ServerError](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L406)
          * XML
            * [raises InvalidResponseBody](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L417)
      * with a Proc for the :auth_callback option
        * that returns a TokenRequest
          * [calls the Proc with token_params when authenticating to obtain the request token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L440)
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L444)
          * when authorised
            * [sets Auth#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L451)
            * [sets Client#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L455)
        * that returns a TokenDetails JSON object
          * [calls the Proc when authenticating to obtain the request token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L489)
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L494)
          * when authorised
            * [sets Auth#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L506)
            * [sets Client#client_id to the new token's client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L510)
        * that returns a TokenDetails object
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L525)
        * that returns a Token string
          * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L541)
      * with auth_option :client_id
        * [returns a token with the client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L571)
      * with token_param :client_id
        * [returns a token with the client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L580)
    * before #authorise has been called
      * [has no current_token_details](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L587)
    * #authorise
      * [updates the persisted token params that are then used for subsequent authorise requests](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L637)
      * [updates the persisted token params that are then used for subsequent authorise requests](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L643)
      * when called for the first time since the client has been instantiated
        * [passes all auth_options and token_params to #request_token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L601)
        * [returns a valid token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L606)
        * [issues a new token if option :force => true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L610)
      * with previous authorisation
        * [does not request a token if current_token_details has not expired](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L621)
        * [requests a new token if token is expired](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L626)
        * [issues a new token if option :force => true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L632)
      * with a Proc for the :auth_callback option
        * [calls the Proc](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L659)
        * [uses the token request returned from the callback when requesting a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L663)
        * for every subsequent #request_token
          * without a :auth_callback Proc
            * [calls the originally provided block](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L669)
          * with a provided block
            * [does not call the originally provided Proc and calls the new #request_token :auth_callback Proc](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L676)
      * with an explicit token string that expires
        * and a Proc for the :auth_callback option to provide a means to renew the token
          * [calls the Proc once the token has expired and the new token is used](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L703)
      * with an explicit ClientOptions client_id
        * and an incompatible client_id in a TokenDetails object passed to the auth callback
          * [rejects a TokenDetails object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L721)
        * and an incompatible client_id in a TokenRequest object passed to the auth callback and raises an exception
          * [rejects a TokenRequests object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L729)
        * and a token string without any retrievable client_id
          * [rejects a TokenRequests object with an incompatible client_id and raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L737)
    * #create_token_request
      * [returns a TokenRequest object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L752)
      * [returns a TokenRequest that can be passed to a client that can use it for authentication without an API key](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L756)
      * [uses the key name from the client](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L763)
      * [uses the default TTL](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L767)
      * [uses the default capability](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L780)
      * with a :ttl option below the Token expiry buffer that ensures tokens are renewed 15s before they expire as they are considered expired
        * [uses the Token expiry buffer default + 10s to allow for a token request in flight](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L774)
      * the nonce
        * [is unique for every request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L785)
        * [is at least 16 characters](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L790)
      * with token param :ttl
        * [overrides default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L801)
      * with token param :nonce
        * [overrides default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L801)
      * with token param :client_id
        * [overrides default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L801)
      * when specifying capability
        * [overrides the default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L812)
        * [uses these capabilities when Ably issues an actual token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L816)
      * with additional invalid attributes
        * [are ignored](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L826)
      * when required fields are missing
        * [should raise an exception if key secret is missing](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L837)
        * [should raise an exception if key name is missing](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L841)
      * timestamp attribute
        * [is a Time object in Ruby and is set to the local time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L868)
        * with :query_time auth_option
          * [queries the server for the timestamp](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L853)
        * with :timestamp option
          * [uses the provided timestamp in the token request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L863)
      * signing
        * [generates a valid HMAC](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L892)
    * using token authentication
      * with :token option
        * [authenticates successfully using the provided :token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L915)
        * [disallows publishing on unspecified capability channels](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L919)
        * [fails if timestamp is invalid](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L927)
        * [cannot be renewed automatically](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L935)
      * when implicit as a result of using :client_id
        * and requests to the Ably server are mocked
          * [will send a token request to the server](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L963)
        * a token is created
          * [before a request is made](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L972)
          * [when a message is published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L976)
          * [with capability and TTL defaults](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L980)
          * [#client_id contains the client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L991)
      * when :client_id is provided in a token
        * [#client_id contains the client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1006)
    * #client_id_validated?
      * when using basic auth
        * [is false as basic auth users do not have an identity](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1018)
      * when using a token auth string for a token with a client_id
        * [is false as identification is not possible from an opaque token string](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1026)
      * when using a token
        * with a client_id
          * [is true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1035)
        * with no client_id (anonymous)
          * [is true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1043)
        * with a wildcard client_id (anonymous)
          * [is false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1051)
      * when using a token request with a client_id
        * [is not true as identification is not confirmed until authenticated](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1060)
        * after authentication
          * [is true as identification is completed during implicit authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1067)
    * when using a :key and basic auth
      * [#using_token_auth? is false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1075)
      * [#key attribute contains the key string](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1079)
      * [#using_basic_auth? is true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/auth_spec.rb#L1083)

### Ably::Rest
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/base_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb))_
  * transport protocol
    * when protocol is not defined it defaults to :msgpack
      * [uses MsgPack](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L27)
    * when option {:protocol=>:json} is used
      * [uses JSON](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L43)
    * when option {:use_binary_protocol=>false} is used
      * [uses JSON](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L43)
    * when option {:protocol=>:msgpack} is used
      * [uses MsgPack](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L60)
    * when option {:use_binary_protocol=>true} is used
      * [uses MsgPack](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L60)
  * using JSON protocol
    * failed requests
      * due to invalid Auth
        * [should raise an InvalidRequest exception with a valid error message and code](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L75)
      * server error with JSON error response body
        * [should raise a ServerError exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L94)
      * 500 server error without a valid JSON response body
        * [should raise a ServerError exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L105)
    * token authentication failures
      * when auth#token_renewable?
        * [should automatically reissue a token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L143)
      * when NOT auth#token_renewable?
        * [should raise an TokenExpired exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L158)
  * using MsgPack protocol
    * failed requests
      * due to invalid Auth
        * [should raise an InvalidRequest exception with a valid error message and code](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L75)
      * server error with JSON error response body
        * [should raise a ServerError exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L94)
      * 500 server error without a valid JSON response body
        * [should raise a ServerError exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L105)
    * token authentication failures
      * when auth#token_renewable?
        * [should automatically reissue a token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L143)
      * when NOT auth#token_renewable?
        * [should raise an TokenExpired exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/base_spec.rb#L158)

### Ably::Rest::Channel
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/channel_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb))_
  * using JSON protocol
    * #publish
      * with name and data arguments
        * [publishes the message and return true indicating success](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L21)
        * and additional attributes
          * [publishes the message with the attributes and return true indicating success](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L30)
      * with a client_id configured in the ClientOptions
        * [publishes the message without a client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L41)
        * [expects a client_id to be added by the realtime service](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L49)
      * with an array of Hash objects with :name and :data attributes
        * [publishes an array of messages in one HTTP request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L62)
      * with an array of Message objects
        * [publishes an array of messages in one HTTP request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L77)
      * without adequate permissions on the channel
        * [raises a permission error when publishing](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L89)
      * null attributes
        * when name is null
          * [publishes the message without a name attribute in the payload](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L98)
        * when data is null
          * [publishes the message without a data attribute in the payload](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L109)
        * with neither name or data attributes
          * [publishes the message without any attributes in the payload](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L120)
      * identified clients
        * when authenticated with a wildcard client_id
          * with a valid client_id in the message
            * [succeeds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L137)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L146)
          * with an empty client_id in the message
            * [succeeds and publishes without a client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L152)
        * when authenticated with a Token string with an implicit client_id
          * without having a confirmed identity
            * with a valid client_id in the message
              * [succeeds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L169)
            * with an invalid client_id in the message
              * [succeeds in the client library but then fails when published to Ably](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L178)
            * with an empty client_id in the message
              * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L184)
        * when authenticated with TokenDetails with a valid client_id
          * with a valid client_id in the message
            * [succeeds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L201)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L210)
          * with an invalid client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L216)
          * with an empty client_id in the message
            * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L222)
        * when anonymous and no client_id
          * with a client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L238)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L244)
          * with an empty client_id in the message
            * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L250)
    * #history
      * [returns a PaginatedResult model](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L278)
      * [returns the current message history for the channel](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L282)
      * [returns paged history using the PaginatedResult model](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L310)
      * message timestamps
        * [are after the messages were published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L295)
      * message IDs
        * [is unique](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L303)
      * direction
        * [returns paged history backwards by default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L331)
        * [returns history forward if specified in the options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L337)
      * limit
        * [defaults to 100](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L349)
    * #history option
      * :start
        * with milliseconds since epoch value
          * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L392)
        * with a Time object value
          * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L402)
      * :end
        * with milliseconds since epoch value
          * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L392)
        * with a Time object value
          * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L402)
      * when argument start is after end
        * [should raise an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L412)
    * #presence
      * [returns a REST Presence object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L422)
  * using MsgPack protocol
    * #publish
      * with name and data arguments
        * [publishes the message and return true indicating success](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L21)
        * and additional attributes
          * [publishes the message with the attributes and return true indicating success](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L30)
      * with a client_id configured in the ClientOptions
        * [publishes the message without a client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L41)
        * [expects a client_id to be added by the realtime service](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L49)
      * with an array of Hash objects with :name and :data attributes
        * [publishes an array of messages in one HTTP request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L62)
      * with an array of Message objects
        * [publishes an array of messages in one HTTP request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L77)
      * without adequate permissions on the channel
        * [raises a permission error when publishing](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L89)
      * null attributes
        * when name is null
          * [publishes the message without a name attribute in the payload](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L98)
        * when data is null
          * [publishes the message without a data attribute in the payload](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L109)
        * with neither name or data attributes
          * [publishes the message without any attributes in the payload](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L120)
      * identified clients
        * when authenticated with a wildcard client_id
          * with a valid client_id in the message
            * [succeeds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L137)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L146)
          * with an empty client_id in the message
            * [succeeds and publishes without a client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L152)
        * when authenticated with a Token string with an implicit client_id
          * without having a confirmed identity
            * with a valid client_id in the message
              * [succeeds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L169)
            * with an invalid client_id in the message
              * [succeeds in the client library but then fails when published to Ably](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L178)
            * with an empty client_id in the message
              * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L184)
        * when authenticated with TokenDetails with a valid client_id
          * with a valid client_id in the message
            * [succeeds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L201)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L210)
          * with an invalid client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L216)
          * with an empty client_id in the message
            * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L222)
        * when anonymous and no client_id
          * with a client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L238)
          * with a wildcard client_id in the message
            * [throws an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L244)
          * with an empty client_id in the message
            * [succeeds and publishes with an implicit client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L250)
    * #history
      * [returns a PaginatedResult model](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L278)
      * [returns the current message history for the channel](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L282)
      * [returns paged history using the PaginatedResult model](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L310)
      * message timestamps
        * [are after the messages were published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L295)
      * message IDs
        * [is unique](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L303)
      * direction
        * [returns paged history backwards by default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L331)
        * [returns history forward if specified in the options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L337)
      * limit
        * [defaults to 100](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L349)
    * #history option
      * :start
        * with milliseconds since epoch value
          * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L392)
        * with a Time object value
          * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L402)
      * :end
        * with milliseconds since epoch value
          * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L392)
        * with a Time object value
          * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L402)
      * when argument start is after end
        * [should raise an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L412)
    * #presence
      * [returns a REST Presence object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channel_spec.rb#L422)

### Ably::Rest::Channels
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/channels_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb))_
  * using JSON protocol
    * using shortcut method #channel on the client object
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L11)
    * using #get method on client#channels
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L11)
    * accessing an existing channel object with different options
      * [overrides the existing channel options and returns the channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L39)
    * accessing an existing channel object without specifying any channel options
      * [returns the existing channel without modifying the channel options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L50)
    * using undocumented array accessor [] method on client#channels
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L11)
  * using MsgPack protocol
    * using shortcut method #channel on the client object
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L11)
    * using #get method on client#channels
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L11)
    * accessing an existing channel object with different options
      * [overrides the existing channel options and returns the channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L39)
    * accessing an existing channel object without specifying any channel options
      * [returns the existing channel without modifying the channel options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L50)
    * using undocumented array accessor [] method on client#channels
      * behaves like a channel
        * [returns a channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L6)
        * [returns channel object and passes the provided options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/channels_spec.rb#L11)

### Ably::Rest::Client
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/client_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb))_
  * using JSON protocol
    * #initialize
      * with only an API key
        * [uses basic authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L24)
      * with an explicit string :token
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L32)
      * with :use_token_auth set to true
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L40)
      * with a :client_id configured
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L48)
      * with an invalid wildcard "*" :client_id
        * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L54)
      * with an :auth_callback Proc
        * [calls the auth Proc to get a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L62)
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L67)
      * with an :auth_callback Proc (clientId provided in library options instead of as a token_request param)
        * [correctly sets the clientId on the token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L76)
      * with an auth URL
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L86)
        * before any REST request
          * [sends an HTTP request to the provided auth URL to get a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L97)
      * auth headers
        * with basic auth
          * [sends the API key in authentication part of the secure URL (the Authorization: Basic header is not used with the Faraday HTTP library by default)](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L117)
        * with token auth
          * without specifying protocol
            * [sends the token string over HTTPS in the Authorization Bearer header with Base64 encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L136)
          * when setting constructor ClientOption :tls to false
            * [sends the token string over HTTP in the Authorization Bearer header with Base64 encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L146)
    * using tokens
      * when expired
        * [creates a new token automatically when the old token expires](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L179)
        * with a different client_id in the subsequent token
          * [fails to authenticate and raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L192)
      * when token has not expired
        * [reuses the existing token for every request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L203)
    * connection transport
      * defaults
        * for default host
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L220)
          * [is configured to timeout connection requests in 15 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L224)
        * for the fallback hosts
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L230)
          * [is configured to timeout connection requests in 15 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L234)
      * with custom http_open_timeout and http_request_timeout options
        * for default host
          * [is configured to use custom open timeout](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L246)
          * [is configured to use custom request timeout](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L250)
        * for the fallback hosts
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L256)
          * [is configured to timeout connection requests in 15 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L260)
    * fallback hosts
      * configured
        * [should make connection attempts to A.ably-realtime.com, B.ably-realtime.com, C.ably-realtime.com, D.ably-realtime.com, E.ably-realtime.com](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L274)
      * when environment is NOT production
        * [does not retry failed requests with fallback hosts when there is a connection error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L291)
      * when environment is production
        * and connection times out
          * [tries fallback hosts 3 times](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L329)
          * and the total request time exeeds 10 seconds
            * [makes no further attempts to any fallback hosts](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L344)
        * and connection fails
          * [tries fallback hosts 3 times](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L360)
        * and basic authentication fails
          * [does not attempt the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L384)
        * and server returns a 50x error
          * [attempts the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L406)
    * with a custom host
      * that does not exist
        * [fails immediately and raises a Faraday Error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L422)
        * fallback hosts
          * [are never used](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L443)
      * that times out
        * [fails immediately and raises a Faraday Error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L458)
        * fallback hosts
          * [are never used](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L471)
    * HTTP configuration options
      * [is frozen](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L528)
      * defaults
        * [#http_open_timeout is 4s](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L483)
        * [#http_request_timeout is 15s](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L487)
        * [#http_max_retry_count is 3](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L491)
        * [#http_max_retry_duration is 10s](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L495)
      * configured
        * [#http_open_timeout uses provided value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L511)
        * [#http_request_timeout uses provided value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L515)
        * [#http_max_retry_count uses provided value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L519)
        * [#http_max_retry_duration uses provided value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L523)
    * #auth
      * [is provides access to the Auth object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L539)
      * [configures the Auth object with all ClientOptions passed to client in the initializer](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L543)
  * using MsgPack protocol
    * #initialize
      * with only an API key
        * [uses basic authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L24)
      * with an explicit string :token
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L32)
      * with :use_token_auth set to true
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L40)
      * with a :client_id configured
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L48)
      * with an invalid wildcard "*" :client_id
        * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L54)
      * with an :auth_callback Proc
        * [calls the auth Proc to get a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L62)
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L67)
      * with an :auth_callback Proc (clientId provided in library options instead of as a token_request param)
        * [correctly sets the clientId on the token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L76)
      * with an auth URL
        * [uses token authentication](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L86)
        * before any REST request
          * [sends an HTTP request to the provided auth URL to get a new token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L97)
      * auth headers
        * with basic auth
          * [sends the API key in authentication part of the secure URL (the Authorization: Basic header is not used with the Faraday HTTP library by default)](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L117)
        * with token auth
          * without specifying protocol
            * [sends the token string over HTTPS in the Authorization Bearer header with Base64 encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L136)
          * when setting constructor ClientOption :tls to false
            * [sends the token string over HTTP in the Authorization Bearer header with Base64 encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L146)
    * using tokens
      * when expired
        * [creates a new token automatically when the old token expires](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L179)
        * with a different client_id in the subsequent token
          * [fails to authenticate and raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L192)
      * when token has not expired
        * [reuses the existing token for every request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L203)
    * connection transport
      * defaults
        * for default host
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L220)
          * [is configured to timeout connection requests in 15 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L224)
        * for the fallback hosts
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L230)
          * [is configured to timeout connection requests in 15 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L234)
      * with custom http_open_timeout and http_request_timeout options
        * for default host
          * [is configured to use custom open timeout](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L246)
          * [is configured to use custom request timeout](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L250)
        * for the fallback hosts
          * [is configured to timeout connection opening in 4 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L256)
          * [is configured to timeout connection requests in 15 seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L260)
    * fallback hosts
      * configured
        * [should make connection attempts to A.ably-realtime.com, B.ably-realtime.com, C.ably-realtime.com, D.ably-realtime.com, E.ably-realtime.com](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L274)
      * when environment is NOT production
        * [does not retry failed requests with fallback hosts when there is a connection error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L291)
      * when environment is production
        * and connection times out
          * [tries fallback hosts 3 times](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L329)
          * and the total request time exeeds 10 seconds
            * [makes no further attempts to any fallback hosts](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L344)
        * and connection fails
          * [tries fallback hosts 3 times](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L360)
        * and basic authentication fails
          * [does not attempt the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L384)
        * and server returns a 50x error
          * [attempts the fallback hosts as this is an authentication failure](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L406)
    * with a custom host
      * that does not exist
        * [fails immediately and raises a Faraday Error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L422)
        * fallback hosts
          * [are never used](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L443)
      * that times out
        * [fails immediately and raises a Faraday Error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L458)
        * fallback hosts
          * [are never used](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L471)
    * HTTP configuration options
      * [is frozen](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L528)
      * defaults
        * [#http_open_timeout is 4s](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L483)
        * [#http_request_timeout is 15s](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L487)
        * [#http_max_retry_count is 3](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L491)
        * [#http_max_retry_duration is 10s](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L495)
      * configured
        * [#http_open_timeout uses provided value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L511)
        * [#http_request_timeout uses provided value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L515)
        * [#http_max_retry_count uses provided value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L519)
        * [#http_max_retry_duration uses provided value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L523)
    * #auth
      * [is provides access to the Auth object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L539)
      * [configures the Auth object with all ClientOptions passed to client in the initializer](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/client_spec.rb#L543)

### Ably::Models::MessageEncoders
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/encoders_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb))_
  * with binary transport protocol
    * without encryption
      * with UTF-8 data
        * [does not apply any encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L41)
      * with binary data
        * [does not apply any encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L52)
      * with JSON data
        * [stringifies the JSON and sets the encoding attribute to "json"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L63)
    * with encryption
      * with UTF-8 data
        * [applies utf-8 and cipher encoding and sets the encoding attribute to "utf-8/cipher+aes-128-cbc"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L78)
      * with binary data
        * [applies cipher encoding and sets the encoding attribute to "cipher+aes-128-cbc"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L89)
      * with JSON data
        * [applies json, utf-8 and cipher encoding and sets the encoding attribute to "json/utf-8/cipher+aes-128-cbc"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L100)
  * with text transport protocol
    * without encryption
      * with UTF-8 data
        * [does not apply any encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L117)
      * with binary data
        * [applies a base64 encoding and sets the encoding attribute to "base64"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L128)
      * with JSON data
        * [stringifies the JSON and sets the encoding attribute to "json"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L139)
    * with encryption
      * with UTF-8 data
        * [applies utf-8, cipher and base64 encodings and sets the encoding attribute to "utf-8/cipher+aes-128-cbc/base64"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L154)
      * with binary data
        * [applies cipher and base64 encoding and sets the encoding attribute to "cipher+aes-128-cbc/base64"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L165)
      * with JSON data
        * [applies json, utf-8, cipher and base64 encoding and sets the encoding attribute to "json/utf-8/cipher+aes-128-cbc/base64"](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/encoders_spec.rb#L176)

### Ably::Rest::Channel messages
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/message_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb))_
  * using JSON protocol
    * publishing with an ASCII_8BIT message name
      * [is converted into UTF_8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L18)
    * with supported data payload content type
      * JSON Object (Hash)
        * [is encoded and decoded to the same hash](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L30)
      * JSON Array
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L39)
      * String
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L48)
      * Binary
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L57)
    * with unsupported data payload content type
      * Integer
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L68)
      * Float
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L76)
      * Boolean
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L84)
      * False
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L92)
    * encryption and encoding
      * with #publish and #history
        * with AES-128-CBC using crypto-data-128.json fixtures
          * item 0 with encrypted encoding utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 1 with encrypted encoding cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 2 with encrypted encoding json/utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 3 with encrypted encoding json/utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
        * with AES-256-CBC using crypto-data-256.json fixtures
          * item 0 with encrypted encoding utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 1 with encrypted encoding cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 2 with encrypted encoding json/utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 3 with encrypted encoding json/utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
        * when publishing lots of messages
          * [encrypts on #publish and decrypts on #history](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L185)
        * when retrieving #history with a different protocol
          * [delivers a String ASCII-8BIT payload to the receiver](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L212)
          * [delivers a String UTF-8 payload to the receiver](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L212)
          * [delivers a Hash payload to the receiver](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L212)
        * when publishing on an unencrypted channel and retrieving with #history on an encrypted channel
          * [does not attempt to decrypt the message](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L228)
        * when publishing on an encrypted channel and retrieving with #history on an unencrypted channel
          * [retrieves the message that remains encrypted with an encrypted encoding attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L249)
          * [logs a Cipher exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L255)
        * publishing on an encrypted channel and retrieving #history with a different algorithm on another client
          * [retrieves the message that remains encrypted with an encrypted encoding attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L276)
          * [logs a Cipher exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L282)
        * publishing on an encrypted channel and subscribing with a different key on another client
          * [retrieves the message that remains encrypted with an encrypted encoding attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L303)
          * [logs a Cipher exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L309)
  * using MsgPack protocol
    * publishing with an ASCII_8BIT message name
      * [is converted into UTF_8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L18)
    * with supported data payload content type
      * JSON Object (Hash)
        * [is encoded and decoded to the same hash](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L30)
      * JSON Array
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L39)
      * String
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L48)
      * Binary
        * [is encoded and decoded to the same Array](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L57)
    * with unsupported data payload content type
      * Integer
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L68)
      * Float
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L76)
      * Boolean
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L84)
      * False
        * [is raises an UnsupportedDataType 40011 exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L92)
    * encryption and encoding
      * with #publish and #history
        * with AES-128-CBC using crypto-data-128.json fixtures
          * item 0 with encrypted encoding utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 1 with encrypted encoding cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 2 with encrypted encoding json/utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 3 with encrypted encoding json/utf-8/cipher+aes-128-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
        * with AES-256-CBC using crypto-data-256.json fixtures
          * item 0 with encrypted encoding utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 1 with encrypted encoding cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 2 with encrypted encoding json/utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
          * item 3 with encrypted encoding json/utf-8/cipher+aes-256-cbc/base64
            * behaves like an Ably encrypter and decrypter
              * [encrypts message automatically when published](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L137)
              * [sends and retrieves messages that are encrypted & decrypted by the Ably library](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L152)
        * when publishing lots of messages
          * [encrypts on #publish and decrypts on #history](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L185)
        * when retrieving #history with a different protocol
          * [delivers a String ASCII-8BIT payload to the receiver](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L212)
          * [delivers a String UTF-8 payload to the receiver](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L212)
          * [delivers a Hash payload to the receiver](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L212)
        * when publishing on an unencrypted channel and retrieving with #history on an encrypted channel
          * [does not attempt to decrypt the message](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L228)
        * when publishing on an encrypted channel and retrieving with #history on an unencrypted channel
          * [retrieves the message that remains encrypted with an encrypted encoding attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L249)
          * [logs a Cipher exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L255)
        * publishing on an encrypted channel and retrieving #history with a different algorithm on another client
          * [retrieves the message that remains encrypted with an encrypted encoding attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L276)
          * [logs a Cipher exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L282)
        * publishing on an encrypted channel and subscribing with a different key on another client
          * [retrieves the message that remains encrypted with an encrypted encoding attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L303)
          * [logs a Cipher exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/message_spec.rb#L309)

### Ably::Rest::Presence
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/presence_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb))_
  * using JSON protocol
    * tested against presence fixture data set up in test app
      * #get
        * [returns current members on the channel with their action set to :present](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L41)
        * with :limit option
          * [returns a paged response limiting number of members per page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L57)
        * default :limit
          * [defaults to a limit of 100](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L89)
        * with :client_id option
          * [returns a list members filtered by the provided client ID](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L98)
        * with :connection_id option
          * [returns a list members filtered by the provided connection ID](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L109)
          * [returns a list members filtered by the provided connection ID](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L113)
      * #history
        * [returns recent presence activity](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L122)
        * default behaviour
          * [uses backwards direction](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L137)
        * with options
          * direction: :forwards
            * [returns recent presence activity forwards with most recent history last](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L149)
          * direction: :backwards
            * [returns recent presence activity backwards with most recent history first](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L164)
    * #history
      * with options
        * limit options
          * default
            * [is set to 100](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L212)
          * set to 1000
            * [is passes the limit query param value 1000](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L225)
        * with time range options
          * :start
            * with milliseconds since epoch value
              * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L255)
            * with Time object value
              * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L265)
          * :end
            * with milliseconds since epoch value
              * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L255)
            * with Time object value
              * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L265)
          * when argument start is after end
            * [should raise an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L276)
    * decoding
      * with encoded fixture data
        * #history
          * [decodes encoded and encryped presence fixture data automatically](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L295)
        * #get
          * [decodes encoded and encryped presence fixture data automatically](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L302)
    * decoding permutations using mocked #history
      * valid decodeable content
        * #get
          * [automaticaly decodes presence messages](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L358)
        * #history
          * [automaticaly decodes presence messages](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L375)
      * invalid data
        * #get
          * [returns the messages still encoded](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L406)
          * [logs a cipher error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L410)
        * #history
          * [returns the messages still encoded](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L430)
          * [logs a cipher error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L434)
  * using MsgPack protocol
    * tested against presence fixture data set up in test app
      * #get
        * [returns current members on the channel with their action set to :present](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L41)
        * with :limit option
          * [returns a paged response limiting number of members per page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L57)
        * default :limit
          * [defaults to a limit of 100](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L89)
        * with :client_id option
          * [returns a list members filtered by the provided client ID](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L98)
        * with :connection_id option
          * [returns a list members filtered by the provided connection ID](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L109)
          * [returns a list members filtered by the provided connection ID](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L113)
      * #history
        * [returns recent presence activity](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L122)
        * default behaviour
          * [uses backwards direction](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L137)
        * with options
          * direction: :forwards
            * [returns recent presence activity forwards with most recent history last](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L149)
          * direction: :backwards
            * [returns recent presence activity backwards with most recent history first](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L164)
    * #history
      * with options
        * limit options
          * default
            * [is set to 100](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L212)
          * set to 1000
            * [is passes the limit query param value 1000](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L225)
        * with time range options
          * :start
            * with milliseconds since epoch value
              * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L255)
            * with Time object value
              * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L265)
          * :end
            * with milliseconds since epoch value
              * [uses this value in the history request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L255)
            * with Time object value
              * [converts the value to milliseconds since epoch in the hisotry request](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L265)
          * when argument start is after end
            * [should raise an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L276)
    * decoding
      * with encoded fixture data
        * #history
          * [decodes encoded and encryped presence fixture data automatically](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L295)
        * #get
          * [decodes encoded and encryped presence fixture data automatically](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L302)
    * decoding permutations using mocked #history
      * valid decodeable content
        * #get
          * [automaticaly decodes presence messages](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L358)
        * #history
          * [automaticaly decodes presence messages](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L375)
      * invalid data
        * #get
          * [returns the messages still encoded](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L406)
          * [logs a cipher error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L410)
        * #history
          * [returns the messages still encoded](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L430)
          * [logs a cipher error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/presence_spec.rb#L434)

### Ably::Rest::Client#stats
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/stats_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb))_
  * using JSON protocol
    * fetching application stats
      * [returns a PaginatedResult object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L54)
      * by minute
        * with no options
          * [uses the minute interval by default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L66)
        * with :from set to last interval and :limit set to 1
          * [retrieves only one stat](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L75)
          * [returns zero value for any missing metrics](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L79)
          * [returns all aggregated message data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L84)
          * [returns inbound realtime all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L89)
          * [returns inbound realtime message data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L94)
          * [returns outbound realtime all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L99)
          * [returns persisted presence all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L104)
          * [returns connections all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L109)
          * [returns channels all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L114)
          * [returns api_requests data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L119)
          * [returns token_requests data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L124)
          * [returns stat objects with #interval_granularity equal to :minute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L129)
          * [returns stat objects with #interval_id matching :start](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L133)
          * [returns stat objects with #interval_time matching :start Time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L137)
        * with :start set to first interval, :limit set to 1 and direction :forwards
          * [returns the first interval stats as stats are provided forwards from :start](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L147)
          * [returns 3 pages of stats](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L151)
        * with :end set to last interval, :limit set to 1 and direction :backwards
          * [returns the 3rd interval stats first as stats are provided backwards from :end](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L163)
          * [returns 3 pages of stats](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L167)
        * with :end set to last interval and :limit set to 3 to ensure only last years stats are included
          * the REST API
            * [defaults to direction :backwards](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L179)
        * with :end set to previous year interval
          * the REST API
            * [defaults to 100 items for pagination](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L191)
      * by hour
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L215)
      * by day
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L215)
      * by month
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L215)
      * when argument start is after end
        * [should raise an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L227)
  * using MsgPack protocol
    * fetching application stats
      * [returns a PaginatedResult object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L54)
      * by minute
        * with no options
          * [uses the minute interval by default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L66)
        * with :from set to last interval and :limit set to 1
          * [retrieves only one stat](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L75)
          * [returns zero value for any missing metrics](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L79)
          * [returns all aggregated message data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L84)
          * [returns inbound realtime all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L89)
          * [returns inbound realtime message data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L94)
          * [returns outbound realtime all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L99)
          * [returns persisted presence all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L104)
          * [returns connections all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L109)
          * [returns channels all data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L114)
          * [returns api_requests data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L119)
          * [returns token_requests data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L124)
          * [returns stat objects with #interval_granularity equal to :minute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L129)
          * [returns stat objects with #interval_id matching :start](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L133)
          * [returns stat objects with #interval_time matching :start Time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L137)
        * with :start set to first interval, :limit set to 1 and direction :forwards
          * [returns the first interval stats as stats are provided forwards from :start](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L147)
          * [returns 3 pages of stats](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L151)
        * with :end set to last interval, :limit set to 1 and direction :backwards
          * [returns the 3rd interval stats first as stats are provided backwards from :end](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L163)
          * [returns 3 pages of stats](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L167)
        * with :end set to last interval and :limit set to 3 to ensure only last years stats are included
          * the REST API
            * [defaults to direction :backwards](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L179)
        * with :end set to previous year interval
          * the REST API
            * [defaults to 100 items for pagination](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L191)
      * by hour
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L215)
      * by day
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L215)
      * by month
        * [should aggregate the stats for that period](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L215)
      * when argument start is after end
        * [should raise an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/stats_spec.rb#L227)

### Ably::Rest::Client#time
_(see [lib/submodules/ably-ruby/spec/acceptance/rest/time_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/time_spec.rb))_
  * using JSON protocol
    * fetching the service time
      * [should return the service time as a Time object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/time_spec.rb#L10)
      * with reconfigured HTTP timeout
        * [should raise a timeout exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/time_spec.rb#L19)
  * using MsgPack protocol
    * fetching the service time
      * [should return the service time as a Time object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/time_spec.rb#L10)
      * with reconfigured HTTP timeout
        * [should raise a timeout exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/acceptance/rest/time_spec.rb#L19)

### Ably::Auth
_(see [lib/submodules/ably-ruby/spec/unit/auth_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb))_
  * client_id option
    * with nil value
      * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L20)
    * as UTF_8 string
      * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L28)
      * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L32)
    * as SHIFT_JIS string
      * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L40)
      * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L44)
    * as ASCII_8BIT string
      * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L52)
      * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L56)
    * as Integer
      * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L64)
  * defaults
    * [should default TTL to 1 hour](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L74)
    * [should default capability to all](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L78)
    * [should have defaults for :ttl and :capability](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/auth_spec.rb#L82)

### Ably::Logger
_(see [lib/submodules/ably-ruby/spec/unit/logger_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/logger_spec.rb))_
  * [uses the language provided Logger by default](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/logger_spec.rb#L15)
  * with a custom Logger
    * with an invalid interface
      * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/logger_spec.rb#L116)
    * with a valid interface
      * [is used](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/logger_spec.rb#L135)

### Ably::Models::ChannelStateChange
_(see [lib/submodules/ably-ruby/spec/unit/models/channel_state_change_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/channel_state_change_spec.rb))_
  * #current
    * [is required](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/channel_state_change_spec.rb#L10)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/channel_state_change_spec.rb#L14)
  * #previous
    * [is required](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/channel_state_change_spec.rb#L20)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/channel_state_change_spec.rb#L24)
  * #reason
    * [is not required](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/channel_state_change_spec.rb#L30)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/channel_state_change_spec.rb#L34)
  * invalid attributes
    * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/channel_state_change_spec.rb#L40)

### Ably::Models::ConnectionDetails
_(see [lib/submodules/ably-ruby/spec/unit/models/connection_details_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_details_spec.rb))_
  * behaves like a model
    * attributes
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #connection_key
        * [retrieves attribute :connection_key](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #max_message_size
        * [retrieves attribute :max_message_size](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #max_frame_size
        * [retrieves attribute :max_frame_size](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #max_inbound_rate
        * [retrieves attribute :max_inbound_rate](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L80)
  * attributes
    * #connection_state_ttl
      * [retrieves attribute :connection_state_ttl and converts it from ms to s](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_details_spec.rb#L19)
  * ==
    * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_details_spec.rb#L28)
    * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_details_spec.rb#L33)
    * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_details_spec.rb#L37)

### Ably::Models::ConnectionStateChange
_(see [lib/submodules/ably-ruby/spec/unit/models/connection_state_change_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb))_
  * #current
    * [is required](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L10)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L14)
  * #previous
    * [is required](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L20)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L24)
  * #retry_in
    * [is not required](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L30)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L34)
  * #reason
    * [is not required](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L40)
    * [is an attribute](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L44)
  * invalid attributes
    * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/connection_state_change_spec.rb#L50)

### Ably::Models::ErrorInfo
_(see [lib/submodules/ably-ruby/spec/unit/models/error_info_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/error_info_spec.rb))_
  * behaves like a model
    * attributes
      * #code
        * [retrieves attribute :code](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #status_code
        * [retrieves attribute :status_code](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #message
        * [retrieves attribute :message](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L80)
  * #status
    * [is an alias for #status_code](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/error_info_spec.rb#L13)

### Ably::Models::Message
_(see [lib/submodules/ably-ruby/spec/unit/models/message_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb))_
  * behaves like a model
    * attributes
      * #id
        * [retrieves attribute :id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #name
        * [retrieves attribute :name](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #data
        * [retrieves attribute :data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #encoding
        * [retrieves attribute :encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L80)
  * #timestamp
    * [retrieves attribute :timestamp as Time object from ProtocolMessage](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L22)
  * #connection_id attribute
    * when this model has a connectionId attribute
      * but no protocol message
        * [uses the model value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L37)
      * with a protocol message with a different connectionId
        * [uses the model value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L45)
    * when this model has no connectionId attribute
      * and no protocol message
        * [uses the model value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L55)
      * with a protocol message with a connectionId
        * [uses the model value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L63)
  * initialized with
    * :name
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L90)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L94)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L102)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L106)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L114)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L118)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L126)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L134)
    * :client_id
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L90)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L94)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L102)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L106)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L114)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L118)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L126)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L134)
    * :encoding
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L90)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L94)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L102)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L106)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L114)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L118)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L126)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/message_spec.rb#L134)

### Ably::Models::PaginatedResult
_(see [lib/submodules/ably-ruby/spec/unit/models/paginated_result_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb))_
  * #items
    * [returns correct length from body](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L31)
    * [is Enumerable](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L35)
    * [is iterable](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L39)
    * [provides [] accessor method](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L57)
    * [#first gets the first item in page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L63)
    * [#last gets the last item in page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L67)
    * #each
      * [returns an enumerator](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L44)
      * [yields each item](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L48)
  * with non paged http response
    * [is the last page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L172)
    * [does not have next page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L176)
    * [does not support pagination](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L180)
    * [returns nil when accessing next page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L184)
    * [returns nil when accessing first page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L188)
  * with paged http response
    * [has next page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L206)
    * [is not the last page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L210)
    * [supports pagination](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L214)
    * accessing next page
      * [returns another PaginatedResult](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L242)
      * [retrieves the next page of results](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L246)
      * [does not have a next page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L251)
      * [is the last page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L255)
      * [returns nil when trying to access the last page when it is the last page](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L259)
      * and then first page
        * [returns a PaginatedResult](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L270)
        * [retrieves the first page of results](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/paginated_result_spec.rb#L274)

### Ably::Models::PresenceMessage
_(see [lib/submodules/ably-ruby/spec/unit/models/presence_message_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb))_
  * behaves like a model
    * attributes
      * #id
        * [retrieves attribute :id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #data
        * [retrieves attribute :data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #encoding
        * [retrieves attribute :encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L80)
  * #connection_id attribute
    * when this model has a connectionId attribute
      * but no protocol message
        * [uses the model value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L25)
      * with a protocol message with a different connectionId
        * [uses the model value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L33)
    * when this model has no connectionId attribute
      * and no protocol message
        * [uses the model value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L43)
      * with a protocol message with a connectionId
        * [uses the model value](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L51)
  * #member_key attribute
    * [is string in format connection_id:client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L61)
    * with the same client id across multiple connections
      * [is unique](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L69)
    * with a single connection and different client_ids
      * [is unique](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L78)
  * #timestamp
    * [retrieves attribute :timestamp as a Time object from ProtocolMessage](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L86)
  * initialized with
    * :client_id
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L138)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L142)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L150)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L154)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L162)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L166)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L174)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L182)
    * :connection_id
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L138)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L142)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L150)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L154)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L162)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L166)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L174)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L182)
    * :encoding
      * as UTF_8 string
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L138)
        * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L142)
      * as SHIFT_JIS string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L150)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L154)
      * as ASCII_8BIT string
        * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L162)
        * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L166)
      * as Integer
        * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L174)
      * as Nil
        * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/presence_message_spec.rb#L182)

### Ably::Models::ProtocolMessage
_(see [lib/submodules/ably-ruby/spec/unit/models/protocol_message_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb))_
  * behaves like a model
    * attributes
      * #id
        * [retrieves attribute :id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #channel
        * [retrieves attribute :channel](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #channel_serial
        * [retrieves attribute :channel_serial](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #connection_id
        * [retrieves attribute :connection_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #connection_key
        * [retrieves attribute :connection_key](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L80)
  * attributes
    * #timestamp
      * [retrieves attribute :timestamp as Time object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L74)
    * #count
      * when missing
        * [is 1](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L83)
      * when non numeric
        * [is 1](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L90)
      * when greater than 1
        * [is the value of count](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L97)
    * #message_serial
      * [converts :msg_serial to an Integer](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L105)
    * #has_message_serial?
      * without msg_serial
        * [returns false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L115)
      * with msg_serial
        * [returns true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L123)
    * #connection_serial
      * [converts :connection_serial to an Integer](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L131)
    * #flags
      * when nil
        * [is zero](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L141)
      * when numeric
        * [is an Integer](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L149)
      * when has_presence
        * [#has_presence_flag? is true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L157)
      * when has another future flag
        * [#has_presence_flag? is false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L165)
    * #has_connection_serial?
      * without connection_serial
        * [returns false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L175)
      * with connection_serial
        * [returns true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L183)
    * #serial
      * with underlying msg_serial
        * [converts :msg_serial to an Integer](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L192)
      * with underlying connection_serial
        * [converts :connection_serial to an Integer](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L200)
      * with underlying connection_serial and msg_serial
        * [prefers connection_serial and converts :connection_serial to an Integer](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L208)
    * #has_serial?
      * without msg_serial or connection_serial
        * [returns false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L219)
      * with msg_serial
        * [returns true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L227)
      * with connection_serial
        * [returns true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L235)
    * #error
      * with no error attribute
        * [returns nil](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L245)
      * with nil error
        * [returns nil](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L253)
      * with error
        * [returns a valid ErrorInfo object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L261)
    * #messages
      * [contains Message objects](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L271)
    * #presence
      * [contains PresenceMessage objects](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L281)
    * #connection_details
      * with a JSON value
        * [contains a ConnectionDetails object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L294)
        * [contains the attributes from the JSON connectionDetails](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L298)
      * without a JSON value
        * [contains an empty ConnectionDetails object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L307)
    * #connection_key
      * existing only in #connection_details.connection_key
        * [is returned](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L319)
      * existing in both #connection_key and #connection_details.connection_key
        * [returns #connection_details.connection_key as #connection_key will be deprecated > 0.8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/protocol_message_spec.rb#L327)

### Ably::Models::Stats
_(see [lib/submodules/ably-ruby/spec/unit/models/stats_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb))_
  * #all stats
    * [returns a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L17)
    * [returns value for message counts](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L21)
    * [returns value for all data transferred](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L25)
    * [returns zero for empty values](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L29)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L33)
    * #all
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L39)
    * #presence
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L39)
    * #messages
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L39)
  * #persisted stats
    * [returns a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L17)
    * [returns value for message counts](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L21)
    * [returns value for all data transferred](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L25)
    * [returns zero for empty values](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L29)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L33)
    * #all
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L39)
    * #presence
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L39)
    * #messages
      * [is a MessageCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L39)
  * #inbound stats
    * [returns a MessageTraffic object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L59)
    * [returns value for realtime message counts](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L63)
    * [returns value for all presence data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L67)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L71)
    * #realtime
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L77)
    * #rest
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L77)
    * #webhook
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L77)
    * #all
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L77)
  * #outbound stats
    * [returns a MessageTraffic object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L59)
    * [returns value for realtime message counts](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L63)
    * [returns value for all presence data](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L67)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L71)
    * #realtime
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L77)
    * #rest
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L77)
    * #webhook
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L77)
    * #all
      * [is a MessageTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L77)
  * #connections stats
    * [returns a ConnectionTypes object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L91)
    * [returns value for tls opened counts](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L95)
    * [returns value for all peak connections](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L99)
    * [returns zero for empty values](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L103)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L107)
    * #tls
      * [is a ResourceCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L113)
    * #plain
      * [is a ResourceCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L113)
    * #all
      * [is a ResourceCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L113)
  * #channels stats
    * [returns a ResourceCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L126)
    * [returns value for opened counts](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L130)
    * [returns value for peak channels](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L134)
    * [returns zero for empty values](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L138)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L142)
    * #opened
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L148)
    * #peak
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L148)
    * #mean
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L148)
    * #min
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L148)
    * #refused
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L148)
  * #api_requests stats
    * [returns a RequestCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L164)
    * [returns value for succeeded](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L168)
    * [returns value for failed](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L172)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L176)
    * #succeeded
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L182)
    * #failed
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L182)
    * #refused
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L182)
  * #token_requests stats
    * [returns a RequestCount object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L164)
    * [returns value for succeeded](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L168)
    * [returns value for failed](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L172)
    * [raises an exception for unknown attributes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L176)
    * #succeeded
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L182)
    * #failed
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L182)
    * #refused
      * [is a Integer object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L182)
  * #interval_granularity
    * [returns the granularity of the interval_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L193)
  * #interval_time
    * [returns a Time object representing the start of the interval](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L201)
  * class methods
    * #to_interval_id
      * when time zone of time argument is UTC
        * [converts time 2014-02-03:05:06 with granularity :month into 2014-02](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L209)
        * [converts time 2014-02-03:05:06 with granularity :day into 2014-02-03](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L213)
        * [converts time 2014-02-03:05:06 with granularity :hour into 2014-02-03:05](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L217)
        * [converts time 2014-02-03:05:06 with granularity :minute into 2014-02-03:05:06](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L221)
        * [fails with invalid granularity](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L225)
        * [fails with invalid time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L229)
      * when time zone of time argument is +02:00
        * [converts time 2014-02-03:06 with granularity :hour into 2014-02-03:04 at UTC +00:00](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L235)
    * #from_interval_id
      * [converts a month interval_id 2014-02 into a Time object in UTC 0](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L242)
      * [converts a day interval_id 2014-02-03 into a Time object in UTC 0](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L247)
      * [converts an hour interval_id 2014-02-03:05 into a Time object in UTC 0](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L252)
      * [converts a minute interval_id 2014-02-03:05:06 into a Time object in UTC 0](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L257)
      * [fails with an invalid interval_id 14-20](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L262)
    * #granularity_from_interval_id
      * [returns a :month interval_id for 2014-02](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L268)
      * [returns a :day interval_id for 2014-02-03](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L272)
      * [returns a :hour interval_id for 2014-02-03:05](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L276)
      * [returns a :minute interval_id for 2014-02-03:05:06](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L280)
      * [fails with an invalid interval_id 14-20](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/stats_spec.rb#L284)

### Ably::Models::TokenDetails
_(see [lib/submodules/ably-ruby/spec/unit/models/token_details_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb))_
  * behaves like a model
    * attributes
      * #token
        * [retrieves attribute :token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #key_name
        * [retrieves attribute :key_name](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L80)
  * attributes
    * #capability
      * [retrieves attribute :capability as parsed JSON](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L21)
    * #issued with :issued option as milliseconds in constructor
      * [retrieves attribute :issued as Time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L31)
    * #issued with :issued option as a Time in constructor
      * [retrieves attribute :issued as Time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L40)
    * #issued when converted to JSON
      * [is in milliseconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L49)
    * #expires with :expires option as milliseconds in constructor
      * [retrieves attribute :expires as Time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L31)
    * #expires with :expires option as a Time in constructor
      * [retrieves attribute :expires as Time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L40)
    * #expires when converted to JSON
      * [is in milliseconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L49)
    * #expired?
      * once grace period buffer has passed
        * [is true](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L61)
      * within grace period buffer
        * [is false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L69)
      * when expires is not available (i.e. string tokens)
        * [is always false](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L77)
  * ==
    * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L87)
    * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L92)
    * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_details_spec.rb#L96)

### Ably::Models::TokenRequest
_(see [lib/submodules/ably-ruby/spec/unit/models/token_request_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb))_
  * behaves like a model
    * attributes
      * #key_name
        * [retrieves attribute :key_name](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #client_id
        * [retrieves attribute :client_id](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #nonce
        * [retrieves attribute :nonce](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
      * #mac
        * [retrieves attribute :mac](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L15)
    * #==
      * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L41)
      * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L46)
      * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L50)
    * is immutable
      * [prevents changes](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L76)
      * [dups options](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/model_behaviour.rb#L80)
  * attributes
    * #capability
      * [retrieves attribute :capability as parsed JSON](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L18)
    * #timestamp
      * with :timestamp option as milliseconds in constructor
        * [retrieves attribute :timestamp as Time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L29)
      * with :timestamp option as Time in constructor
        * [retrieves attribute :timestamp as Time](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L38)
      * when converted to JSON
        * [is in milliseconds since epoch](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L47)
    * #ttl
      * with :ttl option as milliseconds in constructor
        * [retrieves attribute :ttl as seconds](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L59)
      * when converted to JSON
        * [is in milliseconds since epoch](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L68)
  * ==
    * [is true when attributes are the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L78)
    * [is false when attributes are not the same](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L83)
    * [is false when class type differs](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/models/token_request_spec.rb#L87)

### Ably::Rest::Channel
_(see [lib/submodules/ably-ruby/spec/unit/rest/channel_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb))_
  * #initializer
    * as UTF_8 string
      * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L16)
      * [remains as UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L20)
    * as SHIFT_JIS string
      * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L28)
      * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L32)
    * as ASCII_8BIT string
      * [gets converted to UTF-8](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L40)
      * [is compatible with original encoding](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L44)
    * as Integer
      * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L52)
    * as Nil
      * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L60)
  * #publish name argument
    * as UTF_8 string
      * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L72)
    * as SHIFT_JIS string
      * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L80)
    * as ASCII_8BIT string
      * [is permitted](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L88)
    * as Integer
      * [raises an argument error](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channel_spec.rb#L96)

### Ably::Rest::Channels
_(see [lib/submodules/ably-ruby/spec/unit/rest/channels_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb))_
  * creating channels
    * [#get creates a channel](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L12)
    * [#get will reuse the channel object](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L17)
    * [[] creates a channel](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L23)
  * #fetch
    * [retrieves a channel if it exists](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L30)
    * [calls the block if channel is missing](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L35)
  * destroying channels
    * [#release releases the channel resoures](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L43)
  * is Enumerable
    * [allows enumeration](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L59)
    * [provides #length](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L75)
    * #each
      * [returns an enumerator](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L64)
      * [yields each channel](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/channels_spec.rb#L68)

### Ably::Rest::Client
_(see [lib/submodules/ably-ruby/spec/unit/rest/client_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/client_spec.rb))_
  * behaves like a client initializer
    * with invalid arguments
      * empty hash
        * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L28)
      * nil
        * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L36)
      * key: "invalid"
        * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L44)
      * key: "invalid:asdad"
        * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L52)
      * key and key_name
        * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L60)
      * key and key_secret
        * [raises an exception](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L68)
      * client_id as only option
        * [requires a valid key](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L76)
    * with valid arguments
      * key only
        * [connects to the Ably service](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L87)
        * [uses basic auth](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L91)
      * with a string key instead of options hash
        * [sets the key](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L111)
        * [sets the key_name](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L115)
        * [sets the key_secret](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L119)
        * [uses basic auth](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L123)
      * with a string token key instead of options hash
        * [sets the token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L135)
      * with token
        * [sets the token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L143)
      * with token_details
        * [sets the token](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L151)
      * with token_params
        * [configures the default token_params](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L159)
      * endpoint
        * [defaults to production](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L170)
        * with environment option
          * [uses an alternate endpoint](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L177)
        * with rest_host option
          * [uses an alternate endpoint for REST clients](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L185)
        * with realtime_host option
          * PENDING: *[uses an alternate endpoint for Realtime clients](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L194)*
        * with port option and non-TLS connections
          * [uses the custom port for non-TLS requests](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L203)
        * with tls_port option and a TLS connection
          * [uses the custom port for TLS requests](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L211)
      * tls
        * [defaults to TLS](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L234)
        * set to false
          * [uses plain text](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L225)
          * [uses HTTP](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L229)
      * logger
        * default
          * [uses Ruby Logger](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L245)
          * [specifies Logger::WARN log level](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L249)
        * with log_level :none
          * [silences all logging with a NilLogger](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L257)
        * with custom logger and log_level
          * [uses the custom logger](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L275)
          * [sets the custom log level](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L279)
    * delegators
      * [delegates :client_id to .auth](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L293)
      * [delegates :auth_options to .auth](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/shared/client_initializer_behaviour.rb#L298)
  * initializer options
    * TLS
      * disabled
        * [fails for any operation with basic auth and attempting to send an API key over a non-secure connection](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/client_spec.rb#L17)
    * :use_token_auth
      * set to false
        * with a key and :tls => false
          * [fails for any operation with basic auth and attempting to send an API key over a non-secure connection](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/client_spec.rb#L28)
        * without a key
          * [fails as a key is required if not using token auth](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/client_spec.rb#L36)
      * set to true
        * without a key or token
          * [fails as a key is required to issue tokens](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/client_spec.rb#L46)

### Ably::Rest
_(see [lib/submodules/ably-ruby/spec/unit/rest/rest_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/rest_spec.rb))_
  * [constructor returns an Ably::Rest::Client](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/rest/rest_spec.rb#L7)

### Ably::Util::Crypto
_(see [lib/submodules/ably-ruby/spec/unit/util/crypto_spec.rb](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb))_
  * defaults
    * [match other client libraries](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L18)
  * get_default_params
    * [uses the defaults and generates a key if not provided](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L25)
    * [uses the defaults and sets the key size when key is provided](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L32)
  * encrypts & decrypt
    * [#encrypt encrypts a string](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L46)
    * [#decrypt decrypts a string](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L51)
  * encrypting an empty string
    * [raises an ArgumentError](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L60)
  * using shared client lib fixture data
    * with AES-128-CBC
      * behaves like an Ably encrypter and decrypter
        * text payload
          * [encrypts exactly the same binary data as other client libraries](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L83)
          * [decrypts exactly the same binary data as other client libraries](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L87)
    * with AES-256-CBC
      * behaves like an Ably encrypter and decrypter
        * text payload
          * [encrypts exactly the same binary data as other client libraries](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L83)
          * [decrypts exactly the same binary data as other client libraries](https://github.com/ably/ably-ruby/tree/944fa258ca2cd24a0f5e6d1c04189b8ea12399c8/spec/unit/util/crypto_spec.rb#L87)

  -------

  ## Test summary

  * Passing tests: 964
  * Pending tests: 1
  * Failing tests: 0
