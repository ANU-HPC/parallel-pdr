# creates a hash to make a directory for a run
import random
import string
from datetime import datetime

out = datetime.now().strftime("%Y_%m_%d__%H_%M_%S")
out += "__" + ''.join(random.choices(string.ascii_uppercase + string.digits, k=15))
print(out)
