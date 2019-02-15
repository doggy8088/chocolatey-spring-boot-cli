# Chocolatey Package for Spring Boot CLI

The binary distribution is not included in git, it needs to be downloaded before building the package.

https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html#getting-started-installing-the-cli

Steps to build:

1. Download (`download.cmd`)
2. Package (`choco pack`)
3. Test (`choco install spring-boot-cli -dv -s .` and `choco uninstall spring-boot-cli -dv`)
4. Publish (`choco push`)
