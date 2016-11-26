## 0.2.1 (September 22, 2015) ##

## Bug fix
* Fixes regression in omniauth-oauth2 v1.4.0 by [intridea/omniauth-oauth2@85fdbe1](https://github.com/intridea/omniauth-oauth2/commit/85fdbe1)

## 0.2.1 (September 22, 2015) ##

### enhancements
 * Throw omniauth exception when user is not registered on StackExchange so you can rescue it in your app (by [@yimajo](https://github.com/yimajo))

## 0.2.0 (July 16, 2012) ##

### enhancements
  * You can pass the site api key as the value for a GET parameter named sites (e.g. /auth/stackexchange?site=superuser) (by [@ginnyd](https://github.com/ginnyd))

## 0.1.0 (July 11, 2012) ##

### enhancements
  * Add ability to specify site option to uniquely identify the StackExchange site (by [@ginnyd](https://github.com/ginnyd))

    ```ruby
      provider :stackexchange, "client_id", "client_secret", public_key: "key", site: 'stackoverflow'
    ```
