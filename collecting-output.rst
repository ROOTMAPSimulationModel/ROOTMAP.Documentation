Collecting output
===================================

How do I capture output data? I want some real numbers to crunch.
-----------------------------------------------------------------
Data output is controlled by the file OutputRules.xml in the base of your config directory. You can define which characteristics you wish captured, how often and the name of the file to write them to. For a list of output (and input) characteristics, see List of Characteristics in the Documentation directory. You can also look in the View menu on ROOTMAP for a list of characteristics.
Common types of data captured are numeric data, for mathematical calculations, and raytracing data, for animations based on the simulation’s growth over time.
Numeric data that is spatial in nature, such as the number of root tips in each cell of the Scoreboard, will be written in a text file, broken into planes along the Y axis. The image to the left shows a section of an output file. The scoreboard being modelled is 8 cells wide (X), 8 cells deep (Y) and 20 cells down (Z). Each X-Z slice is printed with commas separating cells, line breaks separating Z layers and additional line breaks separating Y slices. This can be altered in the Output Rules.

Raytracing data is written as a text file with an ``.inc`` suffix, in the format read by the free software raytracer `POV-Ray <https://www.povray.org/documentation/index-3.6.php>`_. See [TODO: the Raytracing section of] the :doc:`visualisation` page for further explanation of the .include files and setting up a 3D animation run.
During the model run, when output files are being written to, the on-screen Progress window will show the caption “Output File Alarm”. Numeric output files will be written to the directory ``%AppData%\ROOTMAP\[current version number]``. Raytracing output files will be written to a ``Raytracing`` directory in the same location.