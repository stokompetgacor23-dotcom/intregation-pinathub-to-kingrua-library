import re

with open('pinathubforintregation.lua', 'r', encoding='utf-8', errors='ignore') as f:
    text = f.read()

print("Calls in pinathubforintregation.lua:")
methods = set(re.findall(r':([A-Za-z0-9_]+)\(', text))
for m in sorted(methods):
    if any(k in m for k in ['Tab', 'Section', 'Toggle', 'Button', 'Slider', 'Dropdown', 'Input', 'Keybind', 'Color', 'Paragraph', 'Graph', 'Progress', 'Player', 'Discord', 'Divider']):
        print(f"  {m}")
