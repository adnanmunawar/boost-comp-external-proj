#include <iostream>
#include <stdio.h>
#include <boost/program_options.hpp>

using namespace std;
int main(int argc, char** argv){
cerr << "Hello World!" << endl;

namespace p_opt = boost::program_options;

p_opt::options_description cmd_opts("Application Usage");
cmd_opts.add_options()
        ("help,h", "Show help")
        ("first_option,n", p_opt::value<int>(), "This is the first option")
        ("second_option,i", p_opt::value<string>(), "Tis the second option")
        ("third_option,e", p_opt::value<bool>(), "Ye the third option");

p_opt::variables_map var_map;
p_opt::store(p_opt::command_line_parser(argc, argv).options(cmd_opts).run(), var_map);
p_opt::notify(var_map);

cout << endl;
cout << cmd_opts;
cout << endl;

return 0;
}
