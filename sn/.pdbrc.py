import pdb
import atexit
import os
import readline

class Config(pdb.DefaultConfig):
    #pygments_formatter_class = "pygments.formatters.TerminalTrueColorFormatter"
    pygments_formatter_kwargs = {"style": "material"} # python -c 'from pygments.styles import get_all_styles; print(list(get_all_styles()))'
    use_pygments = True
    sticky_by_default = True
    line_number_color = pdb.Color.turquoise
    filename_color = pdb.Color.green

historyPath = os.path.expanduser("~/.pyhistory")

def save_history(historyPath=historyPath): import readline; readline.write_history_file(historyPath)

if os.path.exists(historyPath): readline.read_history_file(historyPath)

atexit.register(save_history, historyPath=historyPath)

