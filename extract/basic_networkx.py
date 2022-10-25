class DiGraph():
    def __init__(self):
        self.stored_nodes = set()

    def nodes(self):
        return self.stored_nodes

    def edges(self, data=None):
        return set()

    def add_node(self, node):
        self.stored_nodes.add(node)
