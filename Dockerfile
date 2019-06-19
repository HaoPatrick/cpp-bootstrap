FROM madduci/docker-linux-cpp:latest

RUN apt update && apt install git -y
COPY . /usr/src/cpp_project
WORKDIR /usr/src/cpp_project
RUN mkdir build_tmp && cd build_tmp && cmake -DCMAKE_BUILD_TYPE=Release .. && make
ENTRYPOINT ["make", "-C", "build_tmp", "test" ]