# import webbrowser

# file_path = 'index.html'

# html_string = """
# <!DOCTYPE html>
# <html lang="en">
#   <head>
#     <meta charset="UTF-8" />
#   </head>
#   <body>
#     <h2>Hello SBER</h2>

#     <h2 style="background-color: lime;">google.com</h2>
#   </body>
# </html>
# """

# with open(file_path, 'w', encoding='utf-8') as html_file:
#     html_file.write(html_string)

# webbrowser.open_new_tab(file_path)

#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys


def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'web_django.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == 'main':
    main()