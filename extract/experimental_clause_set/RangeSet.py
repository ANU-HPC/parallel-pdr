class RangeSet:
    def __init__(self):
        self.buffer = []
        self.buffer_size = 0
        self.data_size = 0

    def add(m):
        if self.buffer_size == 0:
            self.buffer.insert((m,m),0)
            self.buffer_size+=1
            return

        # if datapoint is less than the leftmost data
        if (m<self.buffer[0][0]):
            if (m == self.buffer[0][0]-1):
                self.buffer[0][0] -= 1;
            } else {
                self.buffer.insert((m,m),0);
                self.buffer_size += 1;
            }
            data_size++;
            return;
        }

    // if datapoint is greater than the rightmost data
    if (m>buffer[buffer_size-1].second) {
      if (m == buffer[buffer_size-1].second+1) {
        buffer[buffer_size-1].second += 1;
      } else {
        buffer.push_back(make_pair(m,m));
        buffer_size++;
      }
      data_size++;
      return;
    }
    // if datapoint is in the leftmost data-range
    if (m<=buffer[0].second) {
      return;
    }
    // if datapoint is in the rightmost data-range
    if (m>=buffer[buffer_size-1].first) {
      return;
    }
    // otherwise data is within the range of the buffer
    int left = 0;
    int right = buffer_size-1;
    while (left+1<right) {
      int middle = (left+right)/2;
      bool less_than_second = (m <= buffer[middle].second);
      bool greater_than_first = (m >= buffer[middle].first);
      if (less_than_second) {
        if (greater_than_first) {
          return; // already contained in middle, just return
        } else {
          right = middle; // to the left of middle
        }
      } else {
        left = middle; // to the right of middle
      }
    }
    // ok, fail to find, datapoint is between right and left
    // three cases, either extend left, extend right, merge left and right, or singleton
    bool extend_left = (m == buffer[left].second+1);
    bool extend_right = (m == buffer[right].first-1);
    if (extend_left) {
      if (extend_right) { // merge left and right
        buffer[left].second = buffer[right].second;
        buffer.erase(buffer.begin()+right);
        buffer_size--;
      } else { // simply extend left
        buffer[left].second += 1;
      }
    } else {
      if (extend_right) { // simply extend right
        buffer[right].first -= 1;
      } else { // add singleton
        buffer.insert(buffer.begin()+right,make_pair(m,m));
        buffer_size++;
      }
    }
    data_size++;
  }








  void insert(int m) {
    add(m);
  }
  bool find(int m) {
    // specific case that teh buffer is totally empty.
    if (buffer_size==0) {
      return false;
    }
    // if datapoint is less than the leftmost data
    if (m<buffer[0].first) {
      return false;
    }
    // if datapoint is greater than the rightmost data
    if (m>buffer[buffer_size-1].second) {
      return false;
    }
    // if datapoint is in the leftmost data-range
    if (m<=buffer[0].second) {
      return true;
    }
    // if datapoint is in the rightmost data-range
    if (m>=buffer[buffer_size-1].first) {
      return true;
    }
    // otherwise data is within the range of the buffer
    int left = 0;
    int right = buffer_size-1;
    while (left+1<right) {
      int middle = (left+right)/2;
      bool less_than_second = (m <= buffer[middle].second);
      bool greater_than_first = (m >= buffer[middle].first);
      if (less_than_second) {
        if (greater_than_first) {
          return true; // already contained in middle, just return true
        } else {
          right = middle; // to the left of middle
        }
      } else {
        left = middle; // to the right of middle
      }
    }
    return false;
  }
  void print() {
    printf("RangeSet: ");
    for (auto it = buffer.begin(); it!=buffer.end(); it++) {
      printf("[%i %i] ",(*it).first,(*it).second);
    }
    printf(", %i pairs, %i elements\n",buffer_size,data_size);
  }
  int size() {
    return data_size;
  }
};

#endif


