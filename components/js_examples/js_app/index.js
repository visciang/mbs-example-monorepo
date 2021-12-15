#!/usr/bin/env node

import * as js_library from "js_library";
import _ from "lodash";

js_library.printHello();
console.log(_.partition([1, 2, 3, 4], (n) => n % 2));
