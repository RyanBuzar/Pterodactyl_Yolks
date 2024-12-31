#
# Copyright (c) 2022 oliver194
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Created from author="oliver194" maintainer="100048880+oliver194@users.noreply.github.com"
# 
# keeping this to format the label for the image source for later once it is published
# LABEL org.opencontainers.image.source="https://github.com/oliver194/yolks"

FROM        --platform=$TARGETOS/$TARGETARCH ubuntu:latest

LABEL       author="RyanBuzar" # maintainer="109171271+RyanBuzar@users.noreply.github.com"
LABEL       org.opencontainers.image.licenses=MIT

RUN         groupadd -g 987 pterodactyl\
	    && useradd -u 999 -m -G pterodactyl pterodactyl\
	    && usermod -a -G pterodactyl pterodactyl

RUN         apt update \
		&& apt full-upgrade -y \
		&& apt -y zip unzip install ca-certificates curl wget git unzip zip tar jq passwd sudo\
		&& echo "pterodactyl ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/pterodactyl

USER pterodactyl


