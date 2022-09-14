git submodule update --init --recursive

mkdir tmp

cd VAL
git checkout master
cd ..

cd lingeling
git checkout master
cd ..

cd rapidjson
git checkout master
cd ..

cd h2-fd-preprocessor
git checkout master
cd ..
