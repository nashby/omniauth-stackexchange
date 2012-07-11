## 0.1.0 (July 11, 2012) ##

### enhancements
  * Add ability to specify site option to uniquely identify the StackExchange site (by [@ginnyd](https://github.com/ginnyd))

    ```ruby
      provider :stackexchange, "client_id", "client_secret", public_key: "key", site: 'stackoverflow'
    ```
