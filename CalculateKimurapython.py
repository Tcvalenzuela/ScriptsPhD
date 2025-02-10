def Kimura80(qseq, sseq):
    """
    Calculations adapted from https://github.com/kgori/python_tools_on_github/blob/master/pairwise_distances.py
    """
    # define transitions, transversions, matches
    transitions = [ "AG", "GA", "CT", "TC"]
    transversions = [ "AC", "CA", "AT", "TA",
                    "GC", "CG", "GT", "TG" ]
    matches = [ "AA", "GG", "CC", "TT"]
    # set counters to 0
    m,ts,tv=0,0,0
    # count transitions, transversions, matches
    for i, j in zip(qseq, sseq):
        if i+j in matches: m+=1
        if i+j in transitions: ts+=1
        if i+j in transversions: tv+=1
    # count number of bp which align (excludes gaps, Ns)
    aln_len = m + ts + tv
    if aln_len != 0:
        # calculate p and q 
        p = ts/aln_len
        q = tv/aln_len
        # calculate Kimura distance
        Kimura_dist = -0.5 * log((1 - 2*p - q) * sqrt( 1 - 2*q ))
    else:
        Kimura_dist = "NA"
      
    return(Kimura_dist)
