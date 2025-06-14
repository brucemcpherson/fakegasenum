import { guard } from './proxies.js'
const ordinalKeySymbol = Symbol('enum_ordinal')

class CircularEnum {
  constructor(name, ordinal) {
    this[ordinalKeySymbol] = ordinal
    this.ordinal = () => this[ordinalKeySymbol]
    this.name = () => name;
    this.toString = () => name;
    this.toJSON = () => name;
    this.compareTo = (e) => this.ordinal() - e.ordinal()
  }
}

export const newCircularEnum = (safe, keys, defaultKey) => {
  const c = new CircularEnum(keys, defaultKey)
  return safe ? guard(c) : c
}

