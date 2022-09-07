
import yaml
import string

def load_config(schema_path: string) -> list:
    with open(schema_path) as schema_file:
        config = yaml.load(schema_file)
    return config