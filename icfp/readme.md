# ICFP Programming Contest 2025

## Overview
Map an unknown library of hexagonal rooms. Each room has doors `0`–`5` and a 2‑bit label (`0`–`3`). A route plan is a string of door numbers; executing it returns the labels of the visited rooms (plan length + 1 labels). Plans always start from the same room.

## HTTP API
`POST /register`
Request: `{ "name": string, "pl": string, "email": string }`
Response: `{ "id": string }`

`POST /select`
Request: `{ "id": string, "problemName": string }`
Response: `{ "problemName": string }`
Selecting a problem generates a new random map. Problem `"probatio"` is a tiny test map.

`POST /explore`
Request: `{ "id": string, "plans": [string] }`
Response: `{ "results": [[int]], "queryCount": int }`
Each plan length ≤ `18n` for `n` rooms. Multiple plans in one request incur a one‑point `queryCount` penalty.

`POST /guess`
Request:
```
{
  "id": string,
  "map": {
    "rooms": [int],
    "startingRoom": int,
    "connections": [
      { "from": {"room": int, "door": int},
        "to":   {"room": int, "door": int} }
    ]
  }
}
```
Response: `{ "correct": boolean }`
Calling `/guess` clears the selected problem.

## Goal
Use as few expeditions (`queryCount`) as possible to submit a correct map.
