#include "Success.h"

Success::Success(Obligation original_obligation, Compressed_Actions, actions, Obligation successor_obligation) {
  _original_obligation = original_obligation;
  _actions = actions;
  _successor_obligation;
}

Obligation Success::original_obligation() {
  return _original_obligation;
}

Compressed_Actions Success::action() {
  return _actions;
}

Obligation Success::successor_obligation() {
  return _successor_obligation;
}
