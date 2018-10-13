# Short abstract 


### Background 
Genome sequencing yields many short reads of DNA from a genome. Genome assembly attempts to reconstruct the original genome from these reads. Most genome assembler software tools are pipelines of many stages. These tools all work towards the same goal using different methods, and new tools allow for interchangeability between all the different stages of different assemblers.   

### Problem 
It is not common to mix and match stages from all the different assembly tools into one and understand the benefits or the disadvantages of doing that, specifically towards understanding the improvement of the assembly quality. Therefore our Hackseq project aims to create a better assembly tool by mixing and matching components of various assembly tools, and visualising the results of this work. The assembly tools that we are considering are displayed [here](https://github.com/hackseq/modular-assembly-hs18/issues/2).


### Solution
We have  attempted to solve this problem by creating modular assembler components for AssemblerFlow, a tool which builds pipelines of tools for genome assembly using Nextflow, and we have created components for a number of assembly tools. // todo: complete this.