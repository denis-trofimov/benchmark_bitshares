#!/usr/bin/env bash #lends you some flexibility on different systems
tcpkali -T 1 -vvv -c1 --channel-lifetime=0.1 -r1 --ws -m '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' hawking.array.io:8090
tcpkali -vvv -r1 --ws -m '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' -m '{"method": "call", "params": [1, "database", []], "id": 3}' -m '{"method": "call", "params": [2, "get_objects", [["2.1.0"]]], "id": 7}' hawking.array.io:8090
tcpkali -vvv -r1 --ws -m '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' -m '{"method": "call", "params": [1, "database", []], "id": 3}' -m '{"method": "call", "params": [2, "get_block", [\{connection.uid}]], "id": 7}' hawking.array.io:8090
tcpkali -vvv -c12 --connect-timeout 3 --latency-marker "last_irreversible_block_num" --message-stop "Assert Exception" -r @100ms --ws -m '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' -m '{"method": "call", "params": [1, "database", []], "id": 3}' -m '{"method": "call", "params": [2, "get_objects", [["2.1.0"]]], "id": 7}' hayking.array.io:8090
tcpkali -vvv -c12 --connect-timeout 3 --latency-marker "transaction_merkle_root" --message-stop "Assert Exception" -r @100ms --ws -m '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' -m '{"method": "call", "params": [1, "database", []], "id": 3}' -m '{"method": "call", "params": [2, "get_block", [\{connection.uid}]], "id": 7}' newton.array.io:8090

tcpkali -vvv -c12 --connect-timeout 3 --latency-marker "transaction_merkle_root" --message-stop "Assert Exception" -r @200ms --ws -m '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' -m '{"method": "call", "params": [1, "database", []], "id": 3}' -m '{"method": "call", "params": [2, "get_block", [\{connection.uid}]], "id": 7}' newton.array.io:8090
##[Mean    =       88.466, StdDeviation   =       73.909]
##[Max     =      612.300, Total count    =          498]
##[Buckets =           10, SubBuckets     =         2048]
#Last received bytes (401): [\201~\001\215{"id":7,"jsonrpc":"2.0","result":{"previous":"0000000ab10d225931c84954b5b26b35d7f45087","timestamp":"2018-08-30T14:15:30","witness":"1.5.7","transaction_merkle_root":"0000000000000000000000000000000000000000","extensions":[],"witness_signature":"200dbcc4c445c45d6cf278b361b9311cf08fac3c4cdbca36623b7afa601e9daaef342d50524a1a74a3146aeadaff5bf8ed76095b0627f717a6c9b9063cc459adaa","transactions":[]}}]
#Total data sent:     9.2 MiB (9651639 bytes)
#Total data received: 22.4 MiB (23531684 bytes)
#Bandwidth per channel: 0.167⇅ Mbps (20.8 kBps)
#Aggregate bandwidth: 1.419↓, 0.582↑ Mbps
#Packet rate estimate: 407.9↓, 368.3↑ (1↓, 1↑ TCP MSS/op)
#Message latency at percentiles: 171.0/471.5/521.1 ms (95/99/99.5%)
#Test duration: 132.681 s.
#Best --message-rate for latency 200ms⁹⁵ᵖ is 24.4385


tcpkali -v 3 -c 10 -r1 --ws -1 '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' -1 '{"method": "call", "params": [1, "database", []], "id": 3}' -m '{"method": "call", "params": [2, "get_block", [\{connection.uid}]], "id": 7}' hawking.array.io:8090

tcpkali -T 5 -vvv -c1 -r10 --ws --first-message-file first-message.json -f message_get_block.txt hawking.array.io:8090
tcpkali -d -T 1 -vvv -c1 -r5 --ws -1 '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' -m '{"method": "call", "params": [1, "database", []], "id": 3}' -f message_get_block.txt hawking.array.io:8090
tcpkali -d -T 1 -vvv -c1 -r5 --ws \
-1 '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' \
 -m '{"method": "call", "params": [1, "database", []], "id": 3}' \
 -m '{"method": "call", "params": [2, "get_block", [\{re [0-9]{1,4}}]], "id": 7}' \
 hawking.array.io:8090

tcpkali -d -T 1 -vvv -c10 -r5 --ws --first-message-file first-message.json \
-f message_get_block.txt hawking.array.io:8090

tcpkali -d -T 1 -vvv -c1 -r100 --ws \
-1 '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' \
 -m '{"method": "call", "params": [1, "database", []], "id": 3}' \
 -m '{"method": "call", "params": [2, "get_block", [\{re [0-9]{1,4}}]], "id": 7}' \
 hawking.array.io:8090

 tcpkali --ws -d -T 1 -vvv -c15 -r @200ms \
--latency-marker "transaction_merkle_root" --message-stop "Assert Exception" \
-1 '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' \
 -m '{"method": "call", "params": [1, "database", []], "id": 3}' \
 -m '{"method": "call", "params": [2, "get_block", [\{re [0-9]{1,4}}]], "id": 7}' \
 hawking.array.io:8090

tcpkali --ws -d -T 5 -vvv -c15 -r@500ms \
--latency-marker "timestamp" --message-stop "Assert Exception" \
-1 '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' \
 -m '{"method": "call", "params": [1, "database", []], "id": 3}' \
 -m '{"method": "call", "params": [2, "get_block", [\{re [0-9]{1,4}}]], "id": 7}' \
 hawking.array.io:8090

tcpkali -T 5 -vvv -c10 -r200 --ws \
-1 '{"method": "call", "params": [1, "login", ["", ""]], "id": 2}' \
 -m '{"method": "call", "params": [1, "database", []], "id": 3}' \
 -m '{"method": "call", "params": [2, "get_block", [\{re [0-9]{1,4}}]], "id": 7}' \
 hawking.array.io:8090

tcpkali -vvv -c12 --connect-timeout 3 --latency-marker "transaction_merkle_root" --message-stop "Assert Exception" -r @200ms --ws \
-1 '{"method": "call", "params": [1, "database", []], "id": 3}' \
 -m '{"method": "call", "params": [2, "get_block", [\{re [0-9]{1,4}}]], "id": 7}' \
 hawking.array.io:8090

tcpkali -vvv --ws -c12 -r @200ms --connect-timeout 3 \
 --latency-marker "transaction_merkle_root" --message-stop "Assert Exception" \
 -1 '{"method": "call", "params": [1, "database", []], "id": 3}'\
 -m '{"method": "call", "params": [2, "get_block", [\{connection.uid}]], "id": 7}'\
 newton.array.io:8090

 # Valid!
tcpkali -d -T 1 -vvv -c1 -r10 --ws \
-1 '{"method": "call", "params": [1, "database", []], "id": 3}' \
 -m '{"method": "call", "params": [2, "get_block", [\{re [0-9]{1,4}}]], "id": 7}' \
 hawking.array.io:8090
