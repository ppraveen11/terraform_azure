# import re

# input_file = "main.tf"
# output_file = "variable.tf"

# with open(input_file, "r") as f:
#     content = f.read()
#     var_names = re.findall(r'var\.(\w+)', content)

# with open(output_file, "w") as f:
#     for var_name in var_names:
#         f.write(f'variable "{var_name}" {{\n')
#         f.write('  default = []\n')
#         f.write('}\n')
import re

input_file = "main.tf"
output_file = "variable.tf"

existing_vars = set()  # Set to keep track of existing variable names

with open(input_file, "r") as f:
    content = f.read()
    var_names = re.findall(r'var\.(\w+)', content)

with open(output_file, "w") as f:
    for var_name in var_names:
        if var_name not in existing_vars:
            existing_vars.add(var_name)  # Add the variable name to the set
            f.write(f'variable "{var_name}" {{\n')
            f.write('  default = []\n')
            f.write('}\n')
