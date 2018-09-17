#!/usr/bin/python
# -*- coding: UTF-8 -*-
""" Scenario test, stress test tool for BitShares based on JSON and pybitshares.
    get_block, get_transaction, get_chain_properties, get_global_properties, get_config, get_chain_id, get_dynamic_global_properties, get_accounts
"""


import json
import logging
from bitshares import BitShares
from bitshares.block import Block, BlockHeader


class Scenario(object):
    """ Scenario test, stress test tool for BitShares based on JSON and pybitshares.
    """
    def __init__(self, script_name = "scenario.json"):
        # try:
        with open(script_name, 'rt') as file:
            self.scenario = json.load(file)
        # except FileNotFoundError, Error
        if not self.scenario or not self.scenario.get("stages", 0):
            print("Empty stages!")

    def run(self):
        # Connect bitshares
        self.bts = BitShares("ws://newton.array.io:8090", nobroadcast=True, debug=True)

        for stage in self.scenario.get("stages", []):
            kwargs: dict = stage.get("params", {})
            result: str = getattr(self, stage.get("method", ''), lambda:None)(**kwargs)
            print(result)


    def get_block(self, block_num: int) -> str:
        """ Obtain the content of one block."""
        block = Block(block_num, blockchain_instance=self.bts, lazy=False)
        return json.dumps(block)


if __name__ == "__main__":
    log = logging.getLogger()
    Scenario().run()
