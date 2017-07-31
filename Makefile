CC = x86_64-hermit-gcc
CFLAGS = -O2 -fopenmp -march=native -mtune=native -DNTIMES=1000 -DSTREAM_ARRAY_SIZE=2000000

FC = gfortran-4.9
FFLAGS = -O2 -fopenmp

all: stream-hermit stream-linux

stream_f.exe: stream.f mysecond.o
	$(CC) $(CFLAGS) -c mysecond.c
	$(FC) $(FFLAGS) -c stream.f
	$(FC) $(FFLAGS) stream.o mysecond.o -o stream_f.exe

stream-hermit: stream.c
	$(CC) $(CFLAGS) $< -o $@ 

stream-linux: stream.c
	gcc $(CFLAGS) $< -o $@ 


clean:
	rm -f stream_f.exe stream_c.exe *.o stream-hermit stream-linux
