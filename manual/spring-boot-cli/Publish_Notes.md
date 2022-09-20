### How to build package

```sh
choco pack
```

### How to test install locally

```sh
choco install spring-boot-cli -d -s .
```

### How to test uninstall locally

```sh
choco uninstall spring-boot-cli -d -s .
```

### Publish

```sh
choco push spring-boot-cli-2.7.3.nupkg --source https://push.chocolatey.org/
```
