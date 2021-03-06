# FA-nf

A pipeline for functional annotation of proteins from non-model organisms implemented in Nextflow engine.
The pipeline uses a set of well characterised software to assign functional information to the proteins of interests, i.e. domains, GO terms annotation, putative name and some other features.

The software used in this pipline is a free software for academic users. For the software from the Center for Biological Sequence(CBS), i.e. signalP, the license agreement should be obtained.

## Requirements

### Nextflow installation
The pipeline is build on Nextflow as a woking engine, so it need to be installed first

```
 wget -qO- get.nextflow.io | bash 
```
The detailed procedure is described in the [Nextflow documentation](https://www.nextflow.io/docs/latest/getstarted.html)

### KEGG orthology groups
Predictions of the KEGG orthology groups (KO) should be obtained outside of the pipeline, i.e. via [KAAS server](http://www.genome.jp/tools/kaas/). 

Note: for the downstream processing of the KO file it is very important to store information about species used for predictions. Species are encoded in three lellters abbreviations, and the list can be copied from the 'Selected organisms' field in the kaas_main form.

### Configuration file
The pipeline require as an input the configuration file with specified parameters, such as path to the input files, specie name, KEGG specie abbreviations used to obtain KO groups, and some more.

The example of configuration file is included into this repository with name main_configuration.config

## Running the pipeline

The pipline has two main steps, executed one after another:
1. The annotation itself, when various software is excuted and the results are stored in the internal database
2. Generation of result files, including main annotation file in gff format and annotation report in pdf format.

The annotation step can be launched by using the following command:

```
./nextflow run  pipeline.nf  --config  configuration_file.config 
```

The result file generation step can be launched by using the following command:
```
./nextflow run  pipeline.nf  --config  configuration_file.config  --results
```

## Pipeline parameters

#### `--results`
This parameter is specifying the execution of the final steps of the pipeline, where result files are generated
#### `-resume`
This Nextflow build-in parameter allow to re-execute processes that has changed or crashed during the pipeline run. Only processes that not finished will be executed.
More information can be found in the [Nextflow documentation](https://www.nextflow.io/docs/latest/getstarted.html#modify-and-resume)
