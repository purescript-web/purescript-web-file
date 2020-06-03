"use strict";

exports.fromBlob = blob => name => new File(blob, name);

exports.name = function (file) { return file.name; };

exports.lastModified = function (file) { return file.lastModified; };
