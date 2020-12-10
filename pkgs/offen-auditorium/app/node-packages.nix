# This file has been generated by node2nix 1.8.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "@babel/runtime-7.11.2" = {
      name = "_at_babel_slash_runtime";
      packageName = "@babel/runtime";
      version = "7.11.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@babel/runtime/-/runtime-7.11.2.tgz";
        sha512 = "TeWkU52so0mPtDcaCTxNBI/IHiz0pZgr8VEFqXFtZWpYD08ZB6FaSwVAS8MKRQAP3bYKiVjwysOJgMFY28o6Tw==";
      };
    };
    "classnames-2.2.6" = {
      name = "classnames";
      packageName = "classnames";
      version = "2.2.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/classnames/-/classnames-2.2.6.tgz";
        sha512 = "JR/iSQOSt+LQIWwrwEzJ9uk0xfN3mTVYMwt1Ir5mUcSN6pU+V4zQFFaJsclJbPuAUQH+yfWef6tm7l1quW3C8Q==";
      };
    };
    "copy-to-clipboard-3.3.1" = {
      name = "copy-to-clipboard";
      packageName = "copy-to-clipboard";
      version = "3.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/copy-to-clipboard/-/copy-to-clipboard-3.3.1.tgz";
        sha512 = "i13qo6kIHTTpCm8/Wup+0b1mVWETvu2kIMzKoK8FpkLkFxlt0znUAHcMzox+T8sPlqtZXq3CulEjQHsYiGFJUw==";
      };
    };
    "date-fns-1.30.1" = {
      name = "date-fns";
      packageName = "date-fns";
      version = "1.30.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/date-fns/-/date-fns-1.30.1.tgz";
        sha512 = "hBSVCvSmWC+QypYObzwGOd9wqdDpOt+0wl0KbU+R+uuZBS1jN8VsD1ss3irQDknRj5NvxiTF6oj/nDRnN/UQNw==";
      };
    };
    "deep-diff-0.3.8" = {
      name = "deep-diff";
      packageName = "deep-diff";
      version = "0.3.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/deep-diff/-/deep-diff-0.3.8.tgz";
        sha1 = "c01de63efb0eec9798801d40c7e0dae25b582c84";
      };
    };
    "envify-4.1.0" = {
      name = "envify";
      packageName = "envify";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/envify/-/envify-4.1.0.tgz";
        sha512 = "IKRVVoAYr4pIx4yIWNsz9mOsboxlNXiu7TNBnem/K/uTHdkyzXWDzHCK7UTolqBbgaBz0tQHsD3YNls0uIIjiw==";
      };
    };
    "esprima-4.0.1" = {
      name = "esprima";
      packageName = "esprima";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz";
        sha512 = "eGuFFw7Upda+g4p+QHvnW0RyTX/SVeJBDM/gCtMARO0cLuT2HcEKnTPvhjV6aGeqrCB/sbNop0Kszm0jsaWU4A==";
      };
    };
    "hoist-non-react-statics-3.3.2" = {
      name = "hoist-non-react-statics";
      packageName = "hoist-non-react-statics";
      version = "3.3.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/hoist-non-react-statics/-/hoist-non-react-statics-3.3.2.tgz";
        sha512 = "/gGivxi8JPKWNm/W0jSmzcMPpfpPLc3dY/6GxhX2hQ9iGj3aDfklV4ET7NjKpSinLpJ5vafa9iiGIEZg10SfBw==";
      };
    };
    "js-tokens-4.0.0" = {
      name = "js-tokens";
      packageName = "js-tokens";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz";
        sha512 = "RdJUflcE3cUzKiMqQgsCu06FPu9UdIJO0beYbPhHN4k6apgJtifcoCtT9bcxOpYBtpD2kCM6Sbzg4CausW/PKQ==";
      };
    };
    "loose-envify-1.4.0" = {
      name = "loose-envify";
      packageName = "loose-envify";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz";
        sha512 = "lyuxPGr/Wfhrlem2CL/UcnUc1zcqKAImBDzukY7Y5F/yQiNdko6+fRLevlw1HgMySw7f611UIY408EtxRSoK3Q==";
      };
    };
    "object-assign-4.1.1" = {
      name = "object-assign";
      packageName = "object-assign";
      version = "4.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz";
        sha1 = "2109adc7965887cfc05cbbd442cac8bfbb360863";
      };
    };
    "offen-./../packages" = {
      name = "offen";
      packageName = "offen";
      version = "0.0.0";
      src = ../packages;
    };
    "plotly.js-basic-dist-1.55.2" = {
      name = "plotly.js-basic-dist";
      packageName = "plotly.js-basic-dist";
      version = "1.55.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/plotly.js-basic-dist/-/plotly.js-basic-dist-1.55.2.tgz";
        sha512 = "ooEC7kYBlreylSG7/avnOK8S036tbWlfxiS32o60M4cgo9roraNlMqv6+9GZRfJTprn+faECU/k8iBGMkiK7Mw==";
      };
    };
    "preact-10.5.2" = {
      name = "preact";
      packageName = "preact";
      version = "10.5.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/preact/-/preact-10.5.2.tgz";
        sha512 = "4y2Q6kMiJtMONMJR7z+o8P5tGkMzVItyy77AXGrUdusv+dk4jwoS3KrpCBkFloY2xsScRJYwZQZrx89tTjDkOw==";
      };
    };
    "preact-router-3.2.1" = {
      name = "preact-router";
      packageName = "preact-router";
      version = "3.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/preact-router/-/preact-router-3.2.1.tgz";
        sha512 = "KEN2VN1DxUlTwzW5IFkF13YIA2OdQ2OvgJTkQREF+AA2NrHRLaGbB68EjS4IeZOa1shvQ1FvEm3bSLta4sXBhg==";
      };
    };
    "prop-types-15.7.2" = {
      name = "prop-types";
      packageName = "prop-types";
      version = "15.7.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/prop-types/-/prop-types-15.7.2.tgz";
        sha512 = "8QQikdH7//R2vurIJSutZ1smHYTcLpRWEOlHnzcWHmBYrOGUysKwSsrC89BCiFj3CbrfJ/nXFdJepOVrY1GCHQ==";
      };
    };
    "react-copy-to-clipboard-5.0.2" = {
      name = "react-copy-to-clipboard";
      packageName = "react-copy-to-clipboard";
      version = "5.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/react-copy-to-clipboard/-/react-copy-to-clipboard-5.0.2.tgz";
        sha512 = "/2t5mLMMPuN5GmdXo6TebFa8IoFxZ+KTDDqYhcDm0PhkgEzSxVvIX26G20s1EB02A4h2UZgwtfymZ3lGJm0OLg==";
      };
    };
    "react-is-16.13.1" = {
      name = "react-is";
      packageName = "react-is";
      version = "16.13.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/react-is/-/react-is-16.13.1.tgz";
        sha512 = "24e6ynE2H+OKt4kqsOvNd8kBpV65zoxbA4BVsEOB3ARVWQki/DHzaUoC5KuON/BiccDaCCTZBuOcfZs70kR8bQ==";
      };
    };
    "react-plotly.js-2.5.0" = {
      name = "react-plotly.js";
      packageName = "react-plotly.js";
      version = "2.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/react-plotly.js/-/react-plotly.js-2.5.0.tgz";
        sha512 = "nzir3uf+tFO1YXVUH5lFfD2plbDuZJXKrCO88KmRVnha2/zEhZBmZO8yS6GcRnLmSrhJkfmj6GTqWWvrJDBCBQ==";
      };
    };
    "react-redux-7.2.1" = {
      name = "react-redux";
      packageName = "react-redux";
      version = "7.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/react-redux/-/react-redux-7.2.1.tgz";
        sha512 = "T+VfD/bvgGTUA74iW9d2i5THrDQWbweXP0AVNI8tNd1Rk5ch1rnMiJkDD67ejw7YBKM4+REvcvqRuWJb7BLuEg==";
      };
    };
    "redux-4.0.5" = {
      name = "redux";
      packageName = "redux";
      version = "4.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/redux/-/redux-4.0.5.tgz";
        sha512 = "VSz1uMAH24DM6MF72vcojpYPtrTUu3ByVWfPL1nPfVRb5mZVTve5GnNCUV53QM/BZ66xfWrm0CTWoM+Xlz8V1w==";
      };
    };
    "redux-logger-3.0.6" = {
      name = "redux-logger";
      packageName = "redux-logger";
      version = "3.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/redux-logger/-/redux-logger-3.0.6.tgz";
        sha1 = "f7555966f3098f3c88604c449cf0baf5778274bf";
      };
    };
    "redux-thunk-2.3.0" = {
      name = "redux-thunk";
      packageName = "redux-thunk";
      version = "2.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/redux-thunk/-/redux-thunk-2.3.0.tgz";
        sha512 = "km6dclyFnmcvxhAcrQV2AkZmPQjzPDjgVlQtR0EQjxZPyJ0BnMf3in1ryuR8A2qU0HldVRfxYXbFSKlI3N7Slw==";
      };
    };
    "regenerator-runtime-0.13.7" = {
      name = "regenerator-runtime";
      packageName = "regenerator-runtime";
      version = "0.13.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0.13.7.tgz";
        sha512 = "a54FxoJDIr27pgf7IgeQGxmqUNYrcV338lf/6gH456HZ/PhX+5BcwHXG9ajESmwe6WRO0tAzRUrRmNONWgkrew==";
      };
    };
    "symbol-observable-1.2.0" = {
      name = "symbol-observable";
      packageName = "symbol-observable";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/symbol-observable/-/symbol-observable-1.2.0.tgz";
        sha512 = "e900nM8RRtGhlV36KGEU9k65K3mPb1WV70OdjfxlG2EAuM1noi/E/BaW/uMhL7bPEssK8QV57vN3esixjUvcXQ==";
      };
    };
    "through-2.3.8" = {
      name = "through";
      packageName = "through";
      version = "2.3.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/through/-/through-2.3.8.tgz";
        sha1 = "0dd4c9ffaabc357960b1b724115d7e0e86a2e1f5";
      };
    };
    "toggle-selection-1.0.6" = {
      name = "toggle-selection";
      packageName = "toggle-selection";
      version = "1.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/toggle-selection/-/toggle-selection-1.0.6.tgz";
        sha1 = "6e45b1263f2017fa0acc7d89d78b15b8bf77da32";
      };
    };
    "underscore-1.11.0" = {
      name = "underscore";
      packageName = "underscore";
      version = "1.11.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/underscore/-/underscore-1.11.0.tgz";
        sha512 = "xY96SsN3NA461qIRKZ/+qox37YXPtSBswMGfiNptr+wrt6ds4HaMw23TP612fEyGekRE6LNRiLYr/aqbHXNedw==";
      };
    };
    "url-polyfill-1.1.10" = {
      name = "url-polyfill";
      packageName = "url-polyfill";
      version = "1.1.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/url-polyfill/-/url-polyfill-1.1.10.tgz";
        sha512 = "vSaPpaRgBrf41+Uky1myiSh6gpcbw8FpwHYnEy0abxndojOBnIs+yh/49gKYFLtUMP9qoNWjn6j9aUVy23Ie2A==";
      };
    };
    "zxcvbn-4.4.2" = {
      name = "zxcvbn";
      packageName = "zxcvbn";
      version = "4.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/zxcvbn/-/zxcvbn-4.4.2.tgz";
        sha1 = "28ec17cf09743edcab056ddd8b1b06262cc73c30";
      };
    };
  };
  args = {
    name = "auditorium";
    packageName = "auditorium";
    version = "0.0.0";
    src = ./.;
    dependencies = [
      sources."@babel/runtime-7.11.2"
      sources."classnames-2.2.6"
      sources."copy-to-clipboard-3.3.1"
      sources."date-fns-1.30.1"
      sources."deep-diff-0.3.8"
      sources."envify-4.1.0"
      sources."esprima-4.0.1"
      sources."hoist-non-react-statics-3.3.2"
      sources."js-tokens-4.0.0"
      sources."loose-envify-1.4.0"
      sources."object-assign-4.1.1"
      sources."offen-./../packages"
      sources."plotly.js-basic-dist-1.55.2"
      sources."preact-10.5.2"
      sources."preact-router-3.2.1"
      sources."prop-types-15.7.2"
      sources."react-copy-to-clipboard-5.0.2"
      sources."react-is-16.13.1"
      sources."react-plotly.js-2.5.0"
      sources."react-redux-7.2.1"
      sources."redux-4.0.5"
      sources."redux-logger-3.0.6"
      sources."redux-thunk-2.3.0"
      sources."regenerator-runtime-0.13.7"
      sources."symbol-observable-1.2.0"
      sources."through-2.3.8"
      sources."toggle-selection-1.0.6"
      sources."underscore-1.11.0"
      sources."url-polyfill-1.1.10"
      sources."zxcvbn-4.4.2"
    ];
    buildInputs = globalBuildInputs;
    meta = {
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}