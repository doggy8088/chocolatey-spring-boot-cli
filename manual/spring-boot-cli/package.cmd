REM Chocolatey and curl must be installed prior to running this packaging script.
REM To test, "choco install spring-boot-cli -dv -s ."

if not exist tools\spring-boot-cli-2.0.5.RELEASE-bin.zip (
  curl https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.0.5.RELEASE/spring-boot-cli-2.0.5.RELEASE-bin.zip ^
    --output tools\spring-boot-cli-2.0.5.RELEASE-bin.zip
)

choco pack
