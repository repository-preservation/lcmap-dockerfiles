import argparse
import subprocess


parser = argparse.ArgumentParser()
parser.add_argument("--year", help="The calendar year to display")
args = parser.parse_args()
print(subprocess.check_output(["cal", args.year]))
