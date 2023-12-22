.. _outputs:

Configuring Outputs and Run End Log
===================================

From v3.0.0, REvoSim has a versatile logging system, that can be accessed by clicking the logging button on the main toolbar. This launches an Output Dock, which appears in the left dock area and has two tabs, placed at the bottom. The Output settings tab has a number of options that dictate the behaviour of the REvoSim logging system, and buttons to output two predefined logs at any point in a run. In addition to these, the Running log tab provides a flexible system for writing logs as a simulation run progresses. 

Output options
--------------

Options in the Output settings tab are as follows:

:Output save path: This is the folder into which all outputs from REvoSim (logs, images, any other files) are saved. For consistency these are all placed within a newly created folder called *REvoSim_output*. Text files are placed within the root of this folder, and images are placed in their own folder within *REvoSim_output*.

:Refresh/polling rate: This is the frequency (in iterations) that the simulation is polled. Polling includes running the full clustering analysis integral to the thorough species-identification algorithm (see RevoSim 2019 paper), writing the in-simulation log, writing any requested image files to disk, and updating the GUI (unless disabled). Because the species identification system has a significant computational overhead, if species tracking is on, frequent polling will significantly slow the simulation.

:Image logging: Any of the simulation visualisations during a run can be saved as an image (png stacks labelled by iteration number). The tick boxes in this part of the tab dictate which images are saved. See :ref:`populationscene` for full descriptions of each option.

Run end log
-----------

REvoSim provides a detailed log file at the end of runs - or on request during a run - that features the information below. This can be automatically output at the end of every run in batch mode (see option *Automatically create detailed log on batch runs* below), or dumped as required using the *Write data for current run* button highlighted below. The log is written to the current output folder, and is placed in a file called REvoSim_end_run_log.txt. This file is structured as follows:

:Timestamp: The first line is a time stamp highlighting when the run was written, in the following format: 2018-12-30T11:57:51
:Settings: A printout of all REvoSim settings for this run then follows, divided into integers and then bools. This means that at any point it is possible to revisit and check all settings for that run.
:Legend: There is then an explanation of the contents of this log file: "This log features the tree from a finished run, in Newick format, and then data for all the species that have existed with more individuals than minimum species size. The exact data provided depends on the phylogeny tracking mode selected in the GUI."

:Tree: There then follows a tree in Newick format for the run to the point at which the log is written, excluding species below minimum species as requested, and also excluding species without descendents if requested. This can then be loaded into, e.g. FigTree to be rendered, or into e.g. R, for analysis. An example tree is shown below - note species labels are prefaced with id for clarity, and also include the maximum size of that species as part of their species name, after a hyphen:

::

  (((((((((((((((((((((((((((id27-81050:50,id28-2:50,id29-1:50,id30-1:50,id31-1:50,id32-5:50,id33-2:50,id34-8:50,id35-1:50)id26-81050:50,id36-3:50,id37-2:50,id38-4:50,id39-3:50,id40-2:50,id41-3:100,id42-4:100,id43-5:100)id25-81050:50,id44-17:150,id45-4:100,(id47-23311:100,id48-2:50)id46-23311:50,id49-2:50,id50-2:100)id24-81050:50,id51-4:50,id52-1:50,id53-5:100,id54-2:50,id55-10:100,id56-11:50,id57-61:200,id58-49:200)id23-81050:50,id59-2:100,id60-2:50,id61-1:50,id62-4:50)id22-81050:50,id63-13:250,id64-2:50,id65-8:50,id66-1:50,id67-1:50,id68-4:50,((id71-24648:50,id72-1:50)id70-24648:50,id73-2:50,id74-3:100)id69-24648:200)id21-81050:50,id75-3:50,id76-14:150,id77-3:50)id20-81050:50,id78-2:150,id79-8:50)id19-81050:50,id80-2:50)id18-81050:50,id81-3:50,id82-2:50,id83-1:50)id17-81050:50,id84-1:50,id85-7:50,id86-2:50,id87-9:150)id16-81050:51,id88-1:1)id15-81050:18,id89-18:69)id14-81050:16,id90-3:35)id13-81050:13,id91-1:6)id12-81050:8,id92-2:42)id11-81050:3,id93-2:16)id10-81050:14,id94-1:13)id9-81050:8,id95-2:11)id8-81050:1,id96-1:9)id7-81050:14,id97-1:12)id6-81050:22,id98-1:12)id5-81050:87,id99-2:73)id4-81050:2,id100-1:12)id3-81050:4,id101-2:141)id2-81050:64,id102-1:10)id1-81050:11,id103-3:82)id0-81050:237

..  
    - [I] Iteration Number

    - [P] Population Grid Data:
    -- Number of living digital organisms
    -- Mean fitness of living digital organisms
    -- Number of entries on the breed list
    -- Number of failed breed attempts
    -- Number of species
    - [S] Species Data:
    -- Species id
    -- Species origin (iterations)
    -- Species parent
    -- Species current size (number of individuals)
    -- Species mean fitness
    -- Species mean environmental (non-interaction) fitness
    -- Species current modal genome
    -- Species current mean trophic level

    **Note that this excludes species with less individuals than minimum species size, but is not able to exclude species without descendants, which can only be achieved with the end-run log.**
..

:Log - detailed species data: The rest of the log file comprises detailed data for each species in csv format, in the same order they appear in the tree. For each species, for every polling iteration, REvoSim provides the following data:

- Species ID
- Species ID of Parent
- Iteration number (i.e. the polling iteration for which this was recorded)
- Number of individuals at polling iteration (size)
- A sample genome for the species, selected as for running log (i.e. randomly), presented as a 32-bit number
- The above genome as a binary string
- Genomic diversity - i.e. the number of different genomes in the species
- The number of pixels occupied by this species, subtracted 1 (i.e. real range is 1-65536, but -1 allows C++ style numbering: 0-65535)
- The geographic range in the form of the maximum distance between outliers
- The centroid of range in X - the mean of all X positions
- The centroid of range in Y - the mean of all Y positions
- Mean fitness of all members of species, stored multiplied by 1000 to allow small changes to be easily identified
- Minimum R, G, then B - the log then reports the minimum R, G and B values the species is found in
- Maximum R, G, then B - as above, but maximum values
- Mean R, G, then B - the final three numbers are the mean R, G, and B values the species inhabits

An example log thus appears:

::

  id,ParentID,iteration,size,sampleGenome,sampleGenome_binary,diversity,cellsOccupied,geog_range,centroid_x,centroid_y,mean_fit,min_env_red,min_env_green,min_env_blue,max_env_red,max_env_green,max_env_blue,mean_env_red,mean_env_green,mean_env_blue
  27,26,1073,34539,17476623570733825285,1111001010001001011100001000101011011110110011101111110100000101,6780,4199,41,20,49,9566,30,41,88,35,54,112,30,44,90
  28,26,1073,1,18017055526017752864,1111101000001001011100001000101011011110110001101101111100100000,1,1,0,29,44,10000,30,44,90,30,44,90,30,44,90
  29,26,1073,1,17441298461089501447,1111001000001011111100001000101011011010110011101001000100000111,1,1,0,31,79,10000,30,44,90,30,44,90,30,44,90
  30,26,1073,1,17312242184062138796,1111000001000001011100001000101011001110100011100111100110101100,1,1,0,5,6,8000,30,44,90,30,44,90,30,44,90
  31,26,1073,1,17726573350043672487,1111011000000001011100001000101011011110010000100101111110100111,1,1,0,41,22,9000,30,44,90,30,44,90,30,44,90
  32,26,1073,5,18021559125636701700,1111101000011001011100001000101011011110010001100101111000000100,1,4,2,3,83,9000,30,44,90,30,44,90,30,44,90
  33,26,1073,2,17439188498342378892,1111001000000100011100011000101011011110110001100111110110001100,1,2,0,3,9,9000,30,44,90,30,44,90,30,44,90
  34,26,1073,3,17440594842165369120,1111001000001001011100001001101011001110110001101101100100100000,1,2,1,36,49,9000,30,44,90,30,44,90,30,44,90
  35,26,1073,1,16358041978649091335,1110001100000011011100001000001011001110010011101001110100000111,1,1,0,36,97,9000,30,44,90,30,44,90,30,44,90
  26,25,1023,34348,17476623570733825285,1111001010001001011100001000101011011110110011101111110100000101,6582,4201,51,20,49,9357,30,41,88,70,105,209,30,44,90
  ...

Run end log options
-------------------

REvoSim provides the following options for the run end log:

:Automatically create detailed log on batch runs: This option outputs the detailed log at the end of each run when REvoSim is operating in batch mode.

:Write data for current run: This option outputs the detailed log for the currently running simulation at the point at which the button is pressed.

:Exclude species without descendents: Under most settings a significant number of small, short-lived species may appear regularly within a REvoSim run. Given the significant amount of data REvoSim can generate, and the fact that these short lived species will be unimportant for many studies (potentially masking important observations), this option rationalises REvoSim detailed logs by only including species with descendents in the end run log and tree.

:Minimum species size: It is also possible to filter the species data in the log files so that only species above a certain number of individuals are included in the logs. This spin box dictates what that minimum cut-off is.


Other options
-------------

:Don't update GUI: This option allows runs to proceed without updating the GUI (although note that this prevents images being saved during a run). Checking this allow REvoSim to run marginally faster, and may be of utility for very long runs.

Custom logs
-----------

In addition to the Run end log, and running log (see :ref:`logging`), there are a series of custom logs that can be selected in the tools option of the main menu (see :ref:`mainmenu`). 
