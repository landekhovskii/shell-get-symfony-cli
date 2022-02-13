#!/bin/bash

PHP_PATH=$(which php)
if [[ -z "$PHP_PATH" ]]; then
  echo "PHP not found!"
  exit 1
fi

CURL_PATH=$(which curl)
if [[ -z "$CURL_PATH" ]]; then
  echo "Curl not found!"
  exit 1
fi

SYMFONY_LATEST_URL=$(curl -sSL https://api.github.com/repos/symfony/cli/releases/latest | grep '/symfony_linux_amd64"' | cut -d '"' -f 4)

echo "Download symfony cli from: $SYMFONY_LATEST_URL"

if [[ ! -d "/usr/local/bin" ]]; then
  mkdir -p /usr/local/bin
fi

curl -sSL "$SYMFONY_LATEST_URL" -o /usr/local/bin/symfony-cli
chmod 755 /usr/local/bin/symfony-cli

symfony-cli -V

exit 0
