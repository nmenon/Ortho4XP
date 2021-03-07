set -x
if [ ! -d "out/Tiles" ]; then
	mkdir -p out/Tiles
fi
docker run --rm -it -v $PWD/out/Tiles:/Ortho4XP/Tiles ortho4xp $*

