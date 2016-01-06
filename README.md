plex.tv for Docker
==================

[plex.tv](http://plex.tv) is a home media server with cloud functionality.

## Running

You can start the image on a Docker host in your local LAN so its available locally.

I run the container with `--net=host`, so all the network connectivity works. You can try it yourself, the [following ports](https://support.plex.tv/hc/en-us/articles/201543147-What-network-ports-do-I-need-to-allow-through-my-firewall) are needed.

The main volume for persistence is `/plex`, this is needed to save all the local settings and cache. You can add any of your media folders to let plex access it.

```shell
docker run --name plex \
    --net=host \
    -v /data/docker/plex:/plex \
    -v /media/Media2/MovieAnnex:/media/MovieAnnex:ro \
    lazyfrosch/plex
```

## Contributing

You are welcome to contribute, please open a issue or PR to input your suggestions.

## License

   Copyright (c) 2015 Markus Frosch <markus@lazyfrosch.de>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
