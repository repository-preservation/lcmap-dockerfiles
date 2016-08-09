# Example Usage:
#
# ```
# $ python index/cli.py ndvi \
#       --x "-1909498" --y "2978512" \
#       --t1 "2013-01-01" --t2 "2014-01-01"
# ```
#
# From a Docker image:
#
# ```
# $ docker run -t usgseros/ubuntu-ndvi:0.5.0 \
#       --x "-1909498" --y "2978512" \
#       --t1 "2013-01-01" --t2 "2014-01-01"
#
import base64
from datetime import datetime
import json

import click
import numpy as np

from lcmap.client import Client


c = Client()


def load(x, y, t1, t2):
    vis_ubid = "LANDSAT_7/ETM/sr_band3"
    _, vis = c.data.tiles(vis_ubid, x, y, t1, t2)
    nir_ubid = "LANDSAT_7/ETM/sr_band4"
    _, nir = c.data.tiles(nir_ubid, x, y, t1, t2)
    return vis, nir


def save(tiles):
    r = []
    for tile in tiles:
        r.append(c.data.save({'tile':tile}).result)
    return r


def encode(data):
    return base64.b64encode(data).decode("utf-8")


def iso8601(date_string):
    fmt = "%Y-%m-%dT%H:%M:%SZ"
    time = datetime.strptime(date_string, fmt)
    return time.isoformat()


@click.group()
def cli():
    pass


@click.command()
@click.option('--x', required=True)
@click.option('--y', required=True)
@click.option('--t1', required=True)
@click.option('--t2', required=True)
#@click.option('--job-id', required=True)
def ndvi(x, y, t1, t2, job_id=None):
    vs, ns = load(x, y, t1, t2)
    tiles = []
    for (nir, vis) in zip(ns, vs):
        data = np.array((nir.data - vis.data) / (nir.data + vis.data))
        data = (data * 10000).astype(np.short)
        tiles.append({
            'ubid': "LCMAP/SEE/NDVI",
            'x': nir.x,
            'y': nir.y,
            'acquired': iso8601(nir.acquired),
            'data': encode(data),
            'source': json.dumps({
                #'job_id': job_id,
                'nir_x': nir.x,
                'nir_y': nir.y,
                'nir_ubid': nir.ubid,
                'nir_acquired': nir.acquired,
                'vis_x': vis.x,
                'vis_y': vis.y,
                'vis_ubid': vis.ubid,
                'vis_acquired': vis.acquired
            })
        })

    # The results are saved, not emitted to STDOUT.
    # click.echo(json.dumps(results, indent=2))
    saved = save(tiles)

    # Details about the job execution are emitted to STDOUT.
    execution = {
        'model': 'lcmap.ndvi',
        'version': '0.5.0',
        #'job-id': job_id,
        'saved': saved
    }
    click.echo(json.dumps(execution, indent=2))


cli.add_command(ndvi)


if __name__ == '__main__':
    cli()

