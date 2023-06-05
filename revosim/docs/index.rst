.. REvoSim documentation master file, created by
   sphinx-quickstart on Thu Apr  5 14:07:27 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to REvoSim's User Manual
================================

The [R]apid [Evo]lutionary [Sim]ulator program.

REvoSim is an individual-based evolutionary model, using a simplified first-principles evolutionary model to facilitate high computational efficiency, allowing the simulation of large populations incorporating space, over geological time, using modest computer hardware. It can simulate populations of 10\ :sup:`5` \–10\ :sup:`7` digital organisms over geological timescales, and incorporates spatial and temporal environmental variation, recombinant or asexual reproduction, mutation and dispersal. Speeds attainable depend on the computer hardware in use, the size of the populations simulated, and details of the experimental setup (most notably on whether species tracking and fitness recalculation are activated). With a typical 2018 desktop computer, speeds of between 500,000 and 1,000,000 iterations per hour can be achieved for populations of around 250,000.

REvoSim has been in development since 2008, and has been released with the intention that it can be used as a multipurpose platform for the study of many evolutionary phenomena. While it was designed with macroevolutionary studies in mind, it is also applicable to microevolutionary problems. As such it is complementary to the many other approaches of studying evolution on a range of different timescales. It is continually developed by the core team to expand its capabilities.

.. figure:: _static/palaeoware_logo_square.png
    :align: center

t:`@palaeoware <https://twitter.com/palaeoware>`_

e:palaeoware@gmail.com

w:`https://github.com/palaeoware <https://github.com/palaeoware>`_


Relevant references
-------------------

Software references:
~~~~~~~~~~~~~~~~~~~~

Garwood, R.J., Spencer A.R.T. and Sutton, M.D., 2019. REvoSim: Organism-level simulation of macro- and microevolution. Palaeontology 62(3),339-355. `https://doi.org/10.1111/pala.12420 <https://doi.org/10.1111/pala.12420>`_

Furness, E.N., Garwood, R.J. and Sutton, M.D., 2023. REvoSim v3.0.0: A fast evolutionary simulation tool with ecological processes. JOSS. Submitted.

Other references:
~~~~~~~~~~~~~~~~~

Furness, E.N., Garwood, R.J., Mannion, P.D. and Sutton, M.D., 2021. Evolutionary simulations clarify and reconcile biodiversity-disturbance models. Proceedings of the Royal Society B, 288(1949), p.20210240. `https://doi.org/10.1098/rspb.2021.0240 <https://doi.org/10.1098/rspb.2021.0240>`_

Furness, E.N., Garwood, R.J., Mannion, P. D. & Sutton, M.D. 2021. Productivity, niche availability, species richness and extinction risk: Untangling relationships using individual-based simulations. Ecology and Evolution 11(13): 8923-8940. `https://doi.org/10.1002/ece3.7730 <https://doi.org/10.1002/ece3.7730>`_


Table of Contents
=================
.. toctree::
   :maxdepth: 3
   :numbered:

   introduction
   requirements
   revosimconcepts
   windowlayout
   settingsorganisms
   settingssimulation
   settingsinteractions
   settingsoutput
   loggingsim
   genomecomparison
   advanced
   commandline
   tests
