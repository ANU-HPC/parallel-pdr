#include "Layers.h"

// TODO when pushing could just add to the layers that haven't seen it before
bool Layers::add_reason(const Reason& reason) {
  const int new_layer = reason.layer();

  const auto reference_to_existing_entry = _all_reasons_contextless_set.find(reason);
  if (reference_to_existing_entry != _all_reasons_contextless_set.end()) {
    // already have it, lets see if we need to bump it up
    const int existing_layer = reference_to_existing_entry->layer();

    if (new_layer < existing_layer) {
      LOG << "WARNING: Adding a reason with a lower layer than one that already exists" << endl;
      return false;
    }

    if (new_layer == existing_layer) return false; // redundant

    // remove the old one
    _all_reasons_contextless_set.erase(reference_to_existing_entry);
    _layer_to_reasons[existing_layer].erase(reason);
  }

  // now lets add the new reason (we may have just removed the old one)
  make_layer_exist(new_layer);
  _all_reasons_contextless_set.insert(reason);
  _layer_to_reasons[new_layer].insert(reason);
  return true;
}

unordered_set<Reason, Reason_Hash>* Layers::reasons_not_in_next_layer(int layer) {
  make_layer_exist(layer);
  return &_layer_to_reasons[layer];
}

bool Layers::same_as_previous(int layer) {
  make_layer_exist(layer);
  return _layer_to_reasons[layer].size() == 0;
}

void Layers::make_layer_exist(int layer) {
  while (_layer_to_reasons.size() <= layer) _layer_to_reasons.push_back(unordered_set<Reason, Reason_Hash>());
}

void Layers::print_sizes() {
  LOG << "number of layers: " << _layer_to_reasons.size() << endl;
  for (int layer=0; layer<_layer_to_reasons.size(); layer++) {
    LOG << "Layer: " << layer << " size: " << _layer_to_reasons[layer].size();
  }
}
