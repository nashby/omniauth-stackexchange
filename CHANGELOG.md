## 0.1.0 (July 11, 2012) ##

### enhancements
  * Add ability to specify site option to uniquely identify the StackExchange site (by [@ginnyd](https://github.com/ginnyd))

    ```ruby
      provider :stackexchange, "client_id", "client_secret", public_key: "key", site: 'stackoverflow'
    ```

## 0.2.0 (July 16, 2012) ##

### enhancements
  * You can pass the site api key as the value for a GET parameter named sites (e.g. /auth/stackexchange?site=superuser) (by [@ginnyd](https://github.com/ginnyd))
