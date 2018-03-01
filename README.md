<p align="center">
  <a href="https://microbadger.com/images/crazymax/syntaxhighlighter"><img src="https://images.microbadger.com/badges/version/crazymax/syntaxhighlighter.svg?style=flat-square" alt="Version"></a>
  <a href="https://travis-ci.org/crazy-max/docker-syntaxhighlighter"><img src="https://img.shields.io/travis/crazy-max/docker-syntaxhighlighter/master.svg?style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/syntaxhighlighter/"><img src="https://img.shields.io/docker/stars/crazymax/syntaxhighlighter.svg?style=flat-square" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/syntaxhighlighter/"><img src="https://img.shields.io/docker/pulls/crazymax/syntaxhighlighter.svg?style=flat-square" alt="Docker Pulls"></a>
  <a href="https://quay.io/repository/crazymax/syntaxhighlighter"><img src="https://quay.io/repository/crazymax/syntaxhighlighter/status?style=flat-square" alt="Docker Repository on Quay"></a>
  <a href="https://beerpay.io/crazy-max/docker-syntaxhighlighter"><img src="https://img.shields.io/beerpay/crazy-max/docker-syntaxhighlighter.svg?style=flat-square" alt="Beerpay"></a>
  <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=T7JD54F4HVCNY"><img src="https://img.shields.io/badge/donate-paypal-7057ff.svg?style=flat-square" alt="Donate Paypal"></a>
</p>

## About

🐳 Docker image to build the javascript [SyntaxHighlighter](https://github.com/syntaxhighlighter/syntaxhighlighter) plugin.<br />
If you are interested, [check out](https://hub.docker.com/r/crazymax/) my other 🐳 Docker images!

## Usage

The default Docker command (`run.sh`) will build all [official brushes and themes](https://github.com/syntaxhighlighter/syntaxhighlighter/wiki/Brushes-and-Themes) as well as custom ones from [assets](assets) folder :

```bash
$ docker run -it --rm \
  -v "$(pwd)/sxh:/syntaxhighlighter/dist" \
  crazymax/syntaxhighlighter:latest
```

You can also use the official [building instructions](https://github.com/syntaxhighlighter/syntaxhighlighter/wiki/Building) commands to customize your build :

```bash
$ docker run -it --rm \
  -v "$(pwd)/sxh:/syntaxhighlighter/dist" \
  crazymax/syntaxhighlighter:latest
  gulp --help
```

## Build

You can build this image yourself if you want for example include more custom brushes / themes :

```bash
$ docker build -t sxh -f ./Dockerfile .
$ docker run -it --rm \
  -v "$(pwd)/sxh:/syntaxhighlighter/dist" \
  sxh
```

## How can i help ?

All kinds of contributions are welcomed :raised_hands:!<br />
The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon:<br />
But we're not gonna lie to each other, I'd rather you buy me a beer or two :beers:!

[![Beerpay](https://beerpay.io/crazy-max/docker-syntaxhighlighter/badge.svg?style=beer-square)](https://beerpay.io/crazy-max/docker-syntaxhighlighter)
or [![Paypal](.res/paypal.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=T7JD54F4HVCNY)

## License

MIT. See `LICENSE` for more details.
