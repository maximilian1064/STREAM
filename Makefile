CC = gcc
CFLAGS = -O2 -fopenmp -DNTIMES=1000 -DSTREAM_ARRAY_SIZE=20000000

FC = gfortran-4.9
FFLAGS = -O2 -fopenmp

all: stream_c.exe

stream_f.exe: stream.f mysecond.o
	$(CC) $(CFLAGS) -c mysecond.c
	$(FC) $(FFLAGS) -c stream.f
	$(FC) $(FFLAGS) stream.o mysecond.o -o stream_f.exe

stream_c.exe: stream.c
	$(CC) $(CFLAGS) stream.c -o stream_c.exe

clean:
	rm -f stream_f.exe stream_c.exe *.o
