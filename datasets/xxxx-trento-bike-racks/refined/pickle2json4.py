#!/usr/bin/python3

import sys
import os
import pickle
import numpy
import yaml

def main():
    if sys.argv[1] and os.path.isfile(sys.argv[1]):
        network_file = sys.argv[1]
        with open(network_file, 'rb') as f:
            network = pickle.load(f)

        from pprint import pprint
#        pprint(vars(network))

        print("{")
        for key in network.keys():
            print('"' + key + '": ')
            pprint(network[key].tolist())
        print("}")
    else:
        print("Usage: %s abs_file_path" % (__file__))


if __name__ == '__main__':
    main()

