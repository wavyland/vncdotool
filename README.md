# vncdotool

[![Build Status](https://github.com/wavyland/vncdotool/workflows/CI/badge.svg)](https://github.com/wavyland/vncdotool/actions?query=workflow%3ACI)

This repository defines a multi-arch Docker image for [vncdotool](https://github.com/sibson/vncdotool).

## Usage

```shell
docker run --rm ghcr.io/wavyland/vncdotool -s 172.17.0.1::5900 type "Hello, Wavyland!"
```
