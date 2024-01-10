#!/bin/sh
#
#  Copyright 2023 The original authors
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

# -XX:+UseEpsilonGC
#JAVA_OPTS="--enable-preview -Xms18g -Xmx18g -XX:+UnlockExperimentalVMOptions"
#time java $JAVA_OPTS --class-path target/average-1.0.0-SNAPSHOT.jar dev.morling.onebrc.CalculateAverage_Kidlike

source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 21.0.1-graal
sdk use java 21.0.1-graal
#NATIVE_IMAGE_OPTS="--gc=epsilon -O3 -march=native --enable-preview"
NATIVE_IMAGE_OPTS="-O3 -march=native --enable-preview"
native-image $NATIVE_IMAGE_OPTS -cp target/average-1.0.0-SNAPSHOT.jar -o image_calculateaverage_Kidlike dev.morling.onebrc.CalculateAverage_Kidlike
time ./image_calculateaverage_Kidlike
