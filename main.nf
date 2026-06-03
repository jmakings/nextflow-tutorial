// define input parameters
params.input = "/data/*.fq"
params.outdir = "results"

// Process 1: Run FastQC on each file
process fastqc {
    publishDir "${params.outdir}/fastqc", mode: 'copy'

    input: 
    path fastq_file

    output:
    path "*.html", emit: html
    path "*.zip", emit: zip

    script:
    """
    fastqc ${fastq_file} --outdir .
    """
}

// Process 2: Aggregate FastQC results with MultiQC
process multiqc {
    publishDir "${params.outdir}", mode: 'copy'

    input:
    path('fastqc/*')

    output:
    path "multiqc_report.html"
    path "multiqc_data", type: 'dir'

    script:
    """
    multiqc .
    """
}

// Define workflow
workflow {
    
    // Create channel from input fastq files
    Channel.fromPath(params.input).set{fastq_ch}

    fastqc_results = fastqc(fastq_ch)
    multiqc(fastqc_results.zip.collect()) // collect all fastqc_results together before multiqc
}