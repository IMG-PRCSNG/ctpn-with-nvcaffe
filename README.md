# Introduction

This is a presentation project, exploring the usage of [NVCaffe](https://github.com/nvidia/caffe) to run [CTPN](https://github.com/tianzhi0549/CTPN). It was created
to make use of the latest features in NVCaffe to improve memory and inference performance of CTPN.

NVCaffe: Link to [fork](https://github.com/IMG-PRCSNG/caffe) used in the project

CTPN: Link to [fork](https://github.com/IMG-PRCSNG/CTPN) used in the project

# Instructions

1. Open this notebook - [ctpn_with_nvcaffe.ipynb](ctpn_with_nvcaffe.ipynb)
2. Click `Open in Colab`
3. Connect to a Runtime with GPU and execute.

Have fun!

# Watch this repo for

- Comparision of inference runtime of baseline against NVCaffe TRT Layer
- Memory consumption with `FP16`
- CTPN with `TensorRT` and `Triton Inference Server`
- Inference Optimization with Python `Multiprocessing` and `Asyncio`
