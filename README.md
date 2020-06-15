<p align="center">
  <a href="https://hub.docker.com/r/crazymax/syntaxhighlighter/tags?page=1&ordering=last_updated"><img src="https://img.shields.io/github/v/tag/crazy-max/docker-syntaxhighlighter?label=version&style=flat-square" alt="Latest Version"></a>
  <a href="https://github.com/crazy-max/docker-syntaxhighlighter/actions?workflow=build"><img src="https://img.shields.io/github/workflow/status/crazy-max/docker-syntaxhighlighter/build?label=build&logo=github&style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/syntaxhighlighter/"><img src="https://img.shields.io/docker/stars/crazymax/syntaxhighlighter.svg?style=flat-square&logo=docker" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/syntaxhighlighter/"><img src="https://img.shields.io/docker/pulls/crazymax/syntaxhighlighter.svg?style=flat-square&logo=docker" alt="Docker Pulls"></a>
  <a href="https://www.codacy.com/app/crazy-max/docker-syntaxhighlighter"><img src="https://img.shields.io/codacy/grade/922cb1922a4e408bbf20235d44865c74.svg?style=flat-square" alt="Code Quality"></a>
  <br /><a href="https://github.com/sponsors/crazy-max"><img src="https://img.shields.io/badge/sponsor-crazy--max-181717.svg?logo=github&style=flat-square" alt="Become a sponsor"></a>
  <a href="https://www.paypal.me/crazyws"><img src="https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square" alt="Donate Paypal"></a>
</p>

## About

🐳 Docker image to build the javascript [SyntaxHighlighter](https://github.com/syntaxhighlighter/syntaxhighlighter) plugin.<br />
If you are interested, [check out](https://hub.docker.com/r/crazymax/) my other Docker images!

💡 Want to be notified of new releases? Check out 🔔 [Diun (Docker Image Update Notifier)](https://github.com/crazy-max/diun) project!

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

All kinds of contributions are welcome :raised_hands:! The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon: You can also support this project by [**becoming a sponsor on GitHub**](https://github.com/sponsors/crazy-max) :clap: or by making a [Paypal donation](https://www.paypal.me/crazyws) to ensure this journey continues indefinitely! :rocket:

Thanks again for your support, it is much appreciated! :pray:

## License

MIT. See `LICENSE` for more details.
