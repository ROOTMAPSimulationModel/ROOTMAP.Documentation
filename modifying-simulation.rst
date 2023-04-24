Modifying a simulation
======================

Use these instructions as a guide for both tweaking existing simulations and creating new ones. Creating a new simulation is best done by modifying an existing one, to minimise the amount of XML manipulation required.

    Ensure the simulation has been unloaded from ROOTMAP - either by closing the simulation or closing ROOTMAP itself - before saving changes to the XML files.

#. Choose a basic configuration to work with. There is a default, if you just want to experiment with the program and get used to it. There are also basic configurations with either wheat or lupin in different standard types of soil. You can begin with one of those and modify it to match your experimental parameters.

#. Your configuration directory must contain the file rootmap.xml. This is what ROOTMAP uses as its entry point into the simulation. It tells the model where to find all the other XML files, and shouldn't need any changing.

#. Define the size of your scoreboard. Do this in ``/Scoreboards.xml``, located in the base directory of the config tree. See :doc:`roots-and-scoreboard`.

#. Position your plants in the Scoreboard (by coordinates). Do this in ``/process-data/Plants.xml``, one ``<Plant>`` element for each plant. This is also where you state which type of plant it is. Types of plants are listed in ``/process-data/PlantTypes.xml``. Currently all plants are of the same type.

    The code is currently limited to a maximum of 3 plants - any more after this will be ignored but may slow down processing.


#. Define your volume object/s (aka VOs; see :doc:`barrier-modelling`), or remove them as desired. Do this in ``/VolumeObjects.xml``. These are cylindrical or rectangular polyhedra used for mimicking pots, gravel etc.

#. Set soil properties by modifying values in ``/scoreboard_data`` directory. If you are using volume objects, there should be a :doc:`Characteristic </nutrients-water-and-other-characteristics>` variant for each VO-wise subdivision of the simulation space [#f1]_ , named accordingly. For example, for the Characteristic *Water Content*, if there are two VOs, there should be three copies of Water Content, named *Water Content VolumeObject [none]*, *Water Content VolumeObject 1* and *Water Content VolumeObject 2*.

#. Continue to configure plant characteristics.

* Is it a legume? Does its nutrient uptake (Imax) decline with time?
* Do you want to include calculating the effects of root hairs?
* Is it growing in nutrient solution rather than soil?
* Most of these kind of variables are in ``/shared-attributes/PlantAttributes.xml``.
* Currently the program gives the same characteristics to all plants of a type in the model run; what you are comparing in the model is same plants but different soil conditions rather than same soil different plants.

8. Set environmental factors.

* When does it rain?
* Temperature of days?
* Do you want to include calculating evaporation? (off by default).
* These settings are mainly in ``/shared-attributes/WaterAttributes.xml`` and ``/process_data/FullRad_RainfallEvents.xml``,  and apply to all plants in the model (they all get rained on).
* check "List Of Characteristics" for others of relevance to your simulation.

9. Check your assumptions. Many of the assumptions that the model makes can be controlled in the XML. For example:

* Temperature (soil) - minimum, maximum, default
* Wilting point
* Maintain Initial Water Content (don't remove the water from the soil when the plants drink it, so that you can see root-nutrient interactions without water dynamics; off  by default)
* These settings are mostly in ``/process_data/Processes.xml``.
* This is not a full list. See "List Of Characteristics" in the documentation.

10. How long does the simulation run for, and do dates matter (e.g. are you matching them to field data)? ``/PostOffice.xml`` has the default run time. Times are recorded in (years, weeks, days, hours, minutes, seconds) so the default of 0,0,35,0,0,0 means 35 days. Dates as set here will be recorded against the model output in the output files.

#. Do you want every run of this simulation to be exactly the same without random variation? Set the Random Seed in ``/PostOffice.xml`` to whatever eight digit number you like, so that all random variations in the model come out the same each time. If you want stochastic variation between your model runs, remove the Random Seed.

#. Set which output characteristics you want to record and their data formats etc. ``/OutputRules.xml`` in the base config directory is where this happens. See :doc:`collecting-output` for more details.

#. Configure any Tables and 2D/3D Views you want in ``/Windows.xml``. See :doc:`visualisation`.

.. rubric:: Footnotes

.. [#f1] The ROOTMAP simulation space is primarily divided by the Scoreboard into ScoreboardBoxes. However, it is also divided by any VolumeObjects present, into one subdivision for each VO and one for the space outside all VOs. This means that, for example, you can have a cylindrical VO in your Scoreboard, and set it up to have an elevated initial level of Nitrate Concentration. The concentrated Nitrate will then migrate around from ScoreboardBox to ScoreboardBox while staying inside the VO.