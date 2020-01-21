export const NucleotideCounts = {
  parse: function(string) {
    const nCount = {A: 0, G: 0, C: 0, T: 0}

    // tally count
    string.split('').forEach((letter, i) => {
       if (letter in nCount) {
         nCount[letter] = nCount[letter] + 1
       } else {
         throw new Error('Invalid nucleotide in strand')
       }
    });

    // return structured data
    return `${nCount.A} ${nCount.C} ${nCount.G} ${nCount.T}`
  }
}
