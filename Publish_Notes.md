### Build

1. Download Spring Boot CLI zip file

    ```bat
    download.cmd
    ```

2. Pack Nupkg file

    ```sh
    choco pack
    ```

### Test Install

```sh
choco install spring-boot-cli -d -s . -y
```

### Test Uninstall

```sh
choco uninstall spring-boot-cli -d -s . -y
```

### Publish package

```sh
choco push spring-boot-cli.3.2.2.nupkg --source https://push.chocolatey.org/
```
