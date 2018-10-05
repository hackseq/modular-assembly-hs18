# Hackseq 2018: Mix and match modular genome assembler components

Genome sequencing yields many short reads of DNA from a genome. Genome assembly attempts to reconstruct the original genome from these reads. Most genome assembler software tools are pipelines of many stages. It's not however typical to mix and match stages from different tools. Our Hackseq project aims to create a better assembly tool by mixing and matching components of various assembly tools.

We will work together to create modular assembler components for AssemblerFlow, a tool which builds pipelines of tools for genome assembly using Nextflow. Each participant will create and run a genome assembly pipeline using AssemblerFlow. We will assess the quality of each assembly, using Quast. Finally, we'll create a leader board of awesomeness to compare the assembly results!

# Plan

Create assembler components for [AssemblerFlow](https://github.com/assemblerflow/flowcraft).

- [ABySS](https://github.com/bcgsc/abyss)
- [BCALM](https://github.com/GATB/bcalm)
- [SPAdes](https://github.com/ablab/spades)
- [Unicycler](https://github.com/rrwick/Unicycler)

Bake off!

- Each participant will create and run an AssemblerFlow pipeline
- Assess the quality of each assembly (using Quast)
- Create a leader board of awesomeness! (using [RStudio](https://www.rstudio.org)'s [Shiny](https://shiny.rstudio.com) or [Flexdashboard](https://rmarkdown.rstudio.com/flexdashboard/))

# Tools

[AssemblerFlow](https://github.com/assemblerflow/flowcraft) builds pipelines of tools for genome assembly. "A [Nextflow](https://www.nextflow.io) pipeline assembler for genomics. Pick your modules. Assemble them. Run the pipeline."

# Software installation instructions

Install [Homebrew](https://brew.sh) on macOS and [Linuxbrew](https://linuxbrew.sh) on Linux and Windows 10, using [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

## macOS

Install [XCode](https://itunes.apple.com/ca/app/xcode/id497799835).

```sh
xcode-select --install
brew install r
brew cask install bandage docker igv java rstudio
```

## Windows

Install [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

## Linux and Windows

Install [RStudio](https://www.rstudio.com/products/rstudio/download/).

```sh
brew install jdk@8 r linuxbrew/extra/singularity brewsci/bio/bandage
```

## All operating systems

```sh
brew tap brewsci/bio
brew install abyss bcalm bwa flowcraft igv miniasm minimap2 ntcard pilon samtools spades unicycler
```

# Data

[Unicycler sample data](https://github.com/rrwick/Unicycler/tree/master/sample_data)

# Prerequisites

- familiarity with the command line and shell scripts is needed
- familiarity with a scripting language such as Python or R is useful
- some familiarity with genome assembly is helpful, but not required
- no need for prior knowledge in AssemblerFlow or NextFlow: they can be learned during the hackathon
