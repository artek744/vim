import re
import os

__config_name=".clang_complete"
__path_flags = ( '-isystem', '-I', '-iquote', '--sysroot' )


def find_configs(fname):
    """
    search for config file
    """
    dirname = os.path.dirname(os.path.realpath(fname))
    configs = []

    while dirname != '/':
        cfg = os.path.join(dirname, __config_name)

        if os.path.exists(cfg):
            configs.append(cfg)

        dirname = os.path.realpath(os.path.join(dirname, '..'))

    return configs

def process_path(config_location, elem):
    """
    process elem to be config_location relative
    """

    def is_abs():
        return elem.startswith('/')

    if is_abs():
        return elem

    return os.path.realpath(os.path.join(config_location, elem))

    

def process_params(cfg, params):
    """
    process path if it is include path
    """
    opt = ( opt for opt in params )
   
    config_location = os.path.dirname(cfg)

    out=[]

    try:
        while True:
            cur = opt.__next__()
            out.append(cur)

            if cur in __path_flags:
                out.append(process_path(config_location, opt.__next__()))


    except StopIteration:
        pass

    return out


__include_pattern = "^("+("|".join(__path_flags))+")(?:=?)(.+)$"

def fix_params(params):
    """
    split glued include parameters (eg. -I/something)
    """
    out=[]

    for line in params:
        m = re.match(__include_pattern, line)

        if m:
            out.extend(m.groups())
        elif len(line):
            out.append(line)

    return out

def get_config_params(cfg):
    """
    read params from config 
    """
    if cfg is None:
        return []

    with open(cfg) as f:
        params = re.split("[\n\s]+", f.read(-1))

    params_fixed = fix_params(params)

    return process_params(cfg, params_fixed)

def get_file_params(fname):
    """
    read params from file
    """
    cfgs = find_configs(fname)
    output = []
    for cfg in reversed(cfgs):
        output.extend(get_config_params(cfg))

    return output

        

if __name__ == "__main__":
    print(fix_params(['-std=/asd/f/','']))
    print(fix_params(['-I','123','']))
    print(fix_params(['-I=c++1y','']))
    print(get_file_params("~/test.cpp"))
