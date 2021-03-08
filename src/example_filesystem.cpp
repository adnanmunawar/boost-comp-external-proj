#include <iostream>
#include <stdio.h>
#include <boost/filesystem/path.hpp>

using namespace std;
int main(int argc, char** argv){
cerr << "Hello World!" << endl;

boost::filesystem::path p("../README.md");
cerr << "Is Path Relative " << p.is_relative() << endl;
cerr << "Is Path Absolute " << p.is_absolute() << endl;
cerr << "Is Complete " << p.is_complete() << endl;
cerr << "Parent Path " << p.parent_path() << endl;

return 0;
}
