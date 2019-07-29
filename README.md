<p align="center">
  <a href="https://hub.docker.com/r/crazymax/syntaxhighlighter/"><img src="https://img.shields.io/badge/dynamic/json.svg?label=version&query=$.results[1].name&url=https://hub.docker.com/v2/repositories/crazymax/syntaxhighlighter/tags&style=flat-square" alt="Latest Version"></a>
  <a href="https://travis-ci.com/crazy-max/docker-syntaxhighlighter"><img src="https://img.shields.io/travis/com/crazy-max/docker-syntaxhighlighter/master.svg?style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/syntaxhighlighter/"><img src="https://img.shields.io/docker/stars/crazymax/syntaxhighlighter.svg?style=flat-square" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/syntaxhighlighter/"><img src="https://img.shields.io/docker/pulls/crazymax/syntaxhighlighter.svg?style=flat-square" alt="Docker Pulls"></a>
  <a href="https://quay.io/repository/crazymax/syntaxhighlighter"><img src="https://quay.io/repository/crazymax/syntaxhighlighter/status?style=flat-square" alt="Docker Repository on Quay"></a>
  <a href="https://www.codacy.com/app/crazy-max/docker-syntaxhighlighter"><img src="https://img.shields.io/codacy/grade/922cb1922a4e408bbf20235d44865c74.svg?style=flat-square" alt="Code Quality"></a>
  <br /><a href="https://www.patreon.com/crazymax"><img src="https://img.shields.io/badge/donate-patreon-fb664e.svg?style=flat-square" alt="Support me on Patreon"></a>
  <a href="https://www.paypal.me/crazyws"><img src="https://img.shields.io/badge/donate-paypal-7057ff.svg?style=flat-square" alt="Donate Paypal"></a>
</p>

## About

🐳 Docker image to build the javascript [SyntaxHighlighter](https://github.com/syntaxhighlighter/syntaxhighlighter) plugin.<br />
If you are interested, [check out](https://hub.docker.com/r/crazymax/) my other 🐳 Docker images!

## Usage

The default Docker command [run.sh](run.sh) will build all [official brushes and themes](https://github.com/syntaxhighlighter/syntaxhighlighter/wiki/Brushes-and-Themes) as well as custom ones from [assets](assets) folder :

```bash
$ docker run -it --rm \
  -v "$(pwd)/sxh:/syntaxhighlighter/dist" \
  crazymax/syntaxhighlighter:latest
```

You can also use the official [building instructions](https://github.com/syntaxhighlighter/syntaxhighlighter/wiki/Building) commands with `gulp` to customize your build :

```bash
$ docker run -it --rm \
  -v "$(pwd)/sxh:/syntaxhighlighter/dist" \
  crazymax/syntaxhighlighter:latest
  gulp --help
```

## Build

You can build this image yourself if you want :

```bash
$ docker build -t sxh -f ./Dockerfile .
$ docker run -it --rm \
  -v "$(pwd)/sxh:/syntaxhighlighter/dist" \
  sxh
```

## How can I help ?

All kinds of contributions are welcome :raised_hands:!<br />
The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon:<br />
But we're not gonna lie to each other, I'd rather you buy me a beer or two :beers:!

[![Support me on Patreon](.res/patreon.png)](https://www.patreon.com/crazymax) 
[![Paypal Donate](.res/paypal.png)](https://www.paypal.me/crazyws)

## License

MIT. See `LICENSE` for more details.
