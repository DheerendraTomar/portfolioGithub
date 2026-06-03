#!/usr/bin/env bash
# Verifies the rebuilt portfolio contains all required content and sections.
set -euo pipefail
cd "$(dirname "$0")"
F="public/index.html"
fail=0
check() { if grep -qiF "$1" "$F"; then echo "ok: $2"; else echo "MISSING: $2"; fail=1; fi; }

[ -f "$F" ] || { echo "MISSING: $F does not exist"; exit 1; }
check "Dheerendra Tomar"                                   "name"
check "Full Stack Python Developer"                        "subtitle"
check "mailto:dheerendr.tomar@gmail.com"                    "email"
check "Uniwire"                                            "role: Uniwire"
check "Red Acre"                                           "role: Red Acre"
check "University of Malta"                                "role: University of Malta"
check "github.com/DheerendraTomar/vegetation-risk-monitor" "project: vegetation"
check "github.com/DheerendraTomar/zeplynew"                "project: hd-wallet"
check "github.com/DheerendraTomar/dairy"                   "project: dairy"
check "github.com/DheerendraTomar/giftasmile"              "project: giftasmile"
check "github.com/DheerendraTomar/IRCTC-Tatkal-Ticket-Booking" "project: irctc"
check "github.com/DheerendraTomar/XKCD_Downloader"         "project: xkcd"
check "github.com/DheerendraTomar/freeCodeCamp"            "project: fcc"
check "linkedin.com/in/dheerendr"                          "social: linkedin"
check "x.com/thelaconicguy"                                "social: twitter"
grep -qi '<meta name="viewport"' "$F" && echo "ok: viewport" || { echo "MISSING: viewport"; fail=1; }
grep -qi '<title>' "$F" && echo "ok: title" || { echo "MISSING: title"; fail=1; }
exit $fail
