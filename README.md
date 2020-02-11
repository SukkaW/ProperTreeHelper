# ProperTree Helper

A helper for ProperTree.

## Installation

Download [`propertree.sh`](https://raw.githubusercontent.com/SukkaW/ProperTreeHelper/master/propertree.sh) and then add following line in your `.bashrc` or `.zshrc`:

```bash
source path/to/propertree.sh
```

## Usage

```
$ propertree help

Usage: propertree <command>

Commands:
   [path/to/plist]   Edit plist file with ProperTree
   update            Update ProperTree
   uninstall         Uninstall ProperTree
   help              Show help message
```

ProperTreeHelper will check if ProperTree is installed every time you use it to open a plist file. ProperTreeHelper will automatically download & install ProperTree if not found.
