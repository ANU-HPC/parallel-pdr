#include "Layers.h"

// the return value is how many layers at the end to add to, makes it cleaner so 0 means don't bother, 1 is just here reason.layer() means everywhere
int Layers::add_reason(const Contextless_Reason& reason) {
  const int new_layer = reason.layer();

  int existing_layer = -1; // assume doesn't exist, update this assumption as we go along

  const auto reference_to_existing_entry = _all_reasons_compare_just_reasons.find(reason);
  if (reference_to_existing_entry != _all_reasons_compare_just_reasons.end()) {
    // already have it, lets see if we need to bump it up
    existing_layer = reference_to_existing_entry->layer();

    // in parallel this is okay
    //if (new_layer < existing_layer) LOG << "WARNING: Adding a reason with a lower layer than one that already exists. Existing:" << reference_to_existing_entry->to_string() << " new " << reason.to_string() <<  endl;

    if (new_layer <= existing_layer) return 0; // redundant

    // remove the old one
    _layer_to_reasons_last_appearing_here[existing_layer].erase(*reference_to_existing_entry);
    _all_reasons_compare_just_reasons.erase(reference_to_existing_entry);
  }

  // now lets add the new reason (we may have just removed the old one)
  make_layer_exist(new_layer);
  _all_reasons_compare_just_reasons.insert(reason);
  _layer_to_reasons_last_appearing_here[new_layer].insert(reason);
  return new_layer-existing_layer; // how many new layers to add to, for instance if it doesn't exist already and the reason is at layer 0, then 0 - (-1) = 1, so it will add it to one layer (layer 0)
}

unordered_set<Contextless_Reason, Contextless_Reason_Hash>* Layers::reasons_not_in_next_layer(int layer) {
  make_layer_exist(layer);
  return &_layer_to_reasons_last_appearing_here[layer];
}

bool Layers::same_as_previous(int layer) {
  make_layer_exist(layer);
  return _layer_to_reasons_last_appearing_here[layer-1].size() == 0;
}

void Layers::make_layer_exist(int layer) {
  while (_layer_to_reasons_last_appearing_here.size() <= layer) {
    _layer_to_reasons_last_appearing_here.push_back(unordered_set<Contextless_Reason, Contextless_Reason_Hash>());
  }
}

void Layers::print_sizes() {
  LOG << "number of layers: " << _layer_to_reasons_last_appearing_here.size() << endl;
  for (int layer=0; layer<_layer_to_reasons_last_appearing_here.size(); layer++) {
    LOG << "Layer: " << layer << " size: " << _layer_to_reasons_last_appearing_here[layer].size() << endl;
  }
}

void Layers::print() {
  for (int layer=0; layer<_layer_to_reasons_last_appearing_here.size(); layer++) {
    LOG << "Layer: " << layer << " size: " << _layer_to_reasons_last_appearing_here[layer].size() << endl;
    for (auto it=_layer_to_reasons_last_appearing_here[layer].begin(); it!=_layer_to_reasons_last_appearing_here[layer].end(); it++) {
      LOG << "  Reason: " << it->to_string() << endl;
    }
  }
}
